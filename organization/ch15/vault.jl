# Going functional all the way
function makevault(encrypt::Function, decrypt::Function)
    passwords = Dict{String, String}()
    
    function addlogin(login::AbstractString, password::AbstractString)
        passwords[login] = encrypt(password)
    end
    
    function getpassword(login::AbstractString)
       decrypt(passwords[login])
    end
    
    addlogin, getpassword
end

# A slightly more object-oriented variant for a more hybrid version
mutable struct Vault
    passwords::Dict{String, String}
    encrypt::Function
    decrypt::Function
end

function Vault(encrypter, decrypter)
    Vault(Dict{String, String}(), encrypter, decrypter)
end

function addlogin!(vault::Vault, login::AbstractString, 
                              password::AbstractString)
    vault.passwords[login] = vault.encrypt(password)
end

function getpassword(vault::Vault, login::AbstractString)
    vault.decrypt(vault.passwords[login])
end
