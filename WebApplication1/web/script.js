function validate() {
    let ele_1 = document.getElementById("ele_1").value;
    let ele_2 = document.getElementById("ele_2").value;
    let ele_3 = document.getElementById("ele_3").value;
    let ele_4 = document.getElementById("ele_4").value;
    let ele_5 = document.getElementById("ele_5").value;

    const nameRegex = /^([A-Z a-z]{1,200})$/;
    const addressRegex = /^([A-Z , 0-9 . / a-z]{1,200})$/;
    const managerRegex = /^([A-Z a-z]{1,200})$/;
    const phoneRegex = /^([0-9]{10})$/;
    const descriptionRegex = /^([A-Z a-z 0-9 . ,]+)$/;

    if (!nameRegex.test(ele_1)) {
        Swal.fire({
            title: 'Invalid or Empty Data',
            text: "The name you entered is invalid or empty!",
            icon: 'warning',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'OK'
        });
        return false;
    }
    if (!addressRegex.test(ele_2)) {
        Swal.fire({
            title: 'Invalid or Empty Data',
            text: "The address you entered is invalid or empty!",
            icon: 'warning',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'OK'
        });
        return false;
    }
    if (!managerRegex.test(ele_3)) {
        Swal.fire({
            title: 'Invalid or Empty Data',
            text: "The manager name you entered is invalid or empty!",
            icon: 'warning',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'OK'
        });
        return false;
    }
    if (!phoneRegex.test(ele_4)) {
        Swal.fire({
            title: 'Invalid or Empty Data',
            text: "The mobile number you entered is invalid or empty!",
            icon: 'warning',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'OK'
        });
        return false;
    }
    if (!descriptionRegex.test(ele_5)) {
        Swal.fire({
            title: 'Invalid or Empty Data',
            text: "The description you entered is invalid or empty!",
            icon: 'warning',
            confirmButtonColor: '#3085d6',
            confirmButtonText: 'OK'
        });
        return false;
    }
    return true;
}
  