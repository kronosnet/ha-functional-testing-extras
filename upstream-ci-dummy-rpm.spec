Name:                   upstream-ci-dummy
Version:                69
Release:                1
Vendor:                 dummy
Group:                  dummy
Summary:                Provides %{name}
License:                %{vendor}
# in Provides: you add whatever you want to fool the system
Buildroot:              %{_tmppath}/%{name}-%{version}-root
Provides:               python3-google-api-client
%description
%{summary}
%files

%changelog
* Wed Jun 18 2025 CI build robot - 69
- updated from commit  by Christine Caulfield
