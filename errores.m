function [Err_s,Err_b] = errores(MensajeBinario,MensajeBinarioRx,M)
Err_b = length(nonzeros(xor(MensajeBinario,MensajeBinarioRx)));
symTx = reshape(MensajeBinario,log2(M),length(MensajeBinarioRx)/log2(M));
symRx = reshape(MensajeBinarioRx,log2(M),length(MensajeBinarioRx)/log2(M));
errs = 0;
for i = 1:size(symTx,2)
    if isequal(symTx(:,i),symRx(:,i))==0
        errs = errs+1;
    end
end
Err_s = errs;
end
