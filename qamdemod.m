function [MensajeBinarioRx]=qamdemod(r_I,r_Q,M)
% BPSK
if M == 2
    for ii=1:length(r_I)
        [~,indice] = min([norm(r_I(ii) - (-1)) norm(r_I(ii) - (1))]);
        I(ii) = indice;
    end
    for ii=1:length(I)
        if I(ii) == 1
            MensajeBinarioRx(ii,:) = false;
        else
            MensajeBinarioRx(ii,:) = true;
        end
    end
    MensajeBinarioRx = reshape(MensajeBinarioRx,1,size(MensajeBinarioRx,1)*...
        size(MensajeBinarioRx,2));
end

% QPSK 
if M == 4
    for ii=1:length(r_I)
        [~,indiceI] = min([norm(r_I(ii) - (-1/sqrt(2/3*(M-1))))...
            norm(r_I(ii) - (1/sqrt(2/3*(M-1))))]);
        [~,indiceQ] = min([norm(r_Q(ii) - (-1/sqrt(2/3*(M-1))))...
            norm(r_Q(ii) - (1/sqrt(2/3*(M-1))))]);
        I(ii) = indiceI;
        Q(ii) = indiceQ;
    end
    for ii=1:length(I)
        if I(ii) == 1
            MensajeBinarioRx_I = false;
        else
            MensajeBinarioRx_I = true;
        end
        if Q(ii) == 1
            MensajeBinarioRx_Q = false;
        else
            MensajeBinarioRx_Q = true;
        end
        MensajeBinarioRx(ii,:) = [MensajeBinarioRx_I MensajeBinarioRx_Q];
    end
    MensajeBinarioRx = reshape(transpose(MensajeBinarioRx),1,size(MensajeBinarioRx,1)*...
        size(MensajeBinarioRx,2));
end

% 16-QAM 
if M == 16
    for ii=1:length(r_I)
        [~,indiceI] = min([norm(r_I(ii) - (-3/sqrt(2/3*(M-1))))...
            norm(r_I(ii) - (-1/sqrt(2/3*(M-1))))...
            norm(r_I(ii) - (1/sqrt(2/3*(M-1))))...
            norm(r_I(ii) - (3/sqrt(2/3*(M-1))))]);
        [~,indiceQ] = min([norm(r_Q(ii) - (-3/sqrt(2/3*(M-1))))...
            norm(r_Q(ii) - (-1/sqrt(2/3*(M-1))))...
            norm(r_Q(ii) - (1/sqrt(2/3*(M-1))))...
            norm(r_Q(ii) - (3/sqrt(2/3*(M-1))))]);        
        I(ii) = indiceI;
        Q(ii) = indiceQ;
    end
    for ii=1:length(I)
        if I(ii) == 1
            MensajeBinarioRx_I = logical([0 0]);
        elseif I(ii) == 2
            MensajeBinarioRx_I = logical([0 1]);
        elseif I(ii) == 3
            MensajeBinarioRx_I = logical([1 1]);
        else
            MensajeBinarioRx_I = logical([1 0]);
        end
        if Q(ii) == 1
            MensajeBinarioRx_Q = logical([0 0]);
        elseif Q(ii) == 2
            MensajeBinarioRx_Q = logical([0 1]);
        elseif Q(ii) == 3
            MensajeBinarioRx_Q = logical([1 1]);
        else
            MensajeBinarioRx_Q = logical([1 0]);
        end        
        MensajeBinarioRx(ii,:) = [MensajeBinarioRx_I MensajeBinarioRx_Q];
    end
    MensajeBinarioRx = reshape(transpose(MensajeBinarioRx),1,size(MensajeBinarioRx,1)*...
        size(MensajeBinarioRx,2));
end

% 64-QAM 
if M == 64
    for ii=1:length(r_I)
        [~,indiceI] = min([norm(r_I(ii) - (-7/sqrt(2/3*(M-1))))...
            norm(r_I(ii) - (-5/sqrt(2/3*(M-1))))...
            norm(r_I(ii) - (-3/sqrt(2/3*(M-1))))...
            norm(r_I(ii) - (-1/sqrt(2/3*(M-1))))...
            norm(r_I(ii) - (1/sqrt(2/3*(M-1))))...
            norm(r_I(ii) - (3/sqrt(2/3*(M-1))))...
            norm(r_I(ii) - (5/sqrt(2/3*(M-1))))...
            norm(r_I(ii) - (7/sqrt(2/3*(M-1))))]);
        [~,indiceQ] = min([norm(r_Q(ii) - (-7/sqrt(2/3*(M-1))))...
            norm(r_Q(ii) - (-5/sqrt(2/3*(M-1))))...
            norm(r_Q(ii) - (-3/sqrt(2/3*(M-1))))...
            norm(r_Q(ii) - (-1/sqrt(2/3*(M-1))))...
            norm(r_Q(ii) - (1/sqrt(2/3*(M-1))))...
            norm(r_Q(ii) - (3/sqrt(2/3*(M-1))))...
            norm(r_Q(ii) - (5/sqrt(2/3*(M-1))))...
            norm(r_Q(ii) - (7/sqrt(2/3*(M-1))))]);      
        I(ii) = indiceI;
        Q(ii) = indiceQ;
    end
    for ii=1:length(I)
        if I(ii) == 1
            MensajeBinarioRx_I = logical([0 0 0]);
        elseif I(ii) == 2
            MensajeBinarioRx_I = logical([0 0 1]);
        elseif I(ii) == 3
            MensajeBinarioRx_I = logical([0 1 1]);
        elseif I(ii) == 4
            MensajeBinarioRx_I = logical([0 1 0]);
        elseif I(ii) == 5
            MensajeBinarioRx_I = logical([1 1 0]);
        elseif I(ii) == 6
            MensajeBinarioRx_I = logical([1 1 1]);
        elseif I(ii) == 7
            MensajeBinarioRx_I = logical([1 0 1]);
        else
            MensajeBinarioRx_I = logical([1 0 0]);
        end
        if Q(ii) == 1
            MensajeBinarioRx_Q = logical([0 0 0]);
        elseif Q(ii) == 2
            MensajeBinarioRx_Q = logical([0 0 1]);
        elseif Q(ii) == 3
            MensajeBinarioRx_Q = logical([0 1 1]);
        elseif Q(ii) == 4
            MensajeBinarioRx_Q = logical([0 1 0]);
        elseif Q(ii) == 5
            MensajeBinarioRx_Q = logical([1 1 0]);
        elseif Q(ii) == 6
            MensajeBinarioRx_Q = logical([1 1 1]);
        elseif Q(ii) == 7
            MensajeBinarioRx_Q = logical([1 0 1]);
        else
            MensajeBinarioRx_Q = logical([1 0 0]);
        end
        MensajeBinarioRx(ii,:) = [MensajeBinarioRx_I MensajeBinarioRx_Q];
    end
    MensajeBinarioRx = reshape(transpose(MensajeBinarioRx),1,size(MensajeBinarioRx,1)*...
        size(MensajeBinarioRx,2));
end
end
