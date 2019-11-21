Return-Path: <navid.emamdoost@gmail.com>
MIME-Version: 1.0
References: <20190917033124.1077-1-navid.emamdoost@gmail.com>
In-Reply-To: <20190917033124.1077-1-navid.emamdoost@gmail.com>
From: Navid Emamdoost <navid.emamdoost@gmail.com>
Date: Thu, 21 Nov 2019 12:20:19 -0600
Message-ID: <CAEkB2EQTO3wtCrZgLv068xGpxJYwir_SuMUBK0jGaTU6KdCRNg@mail.gmail.com>
Subject: Re: [PATCH] rpmsg: char: release allocated memory
Content-Type: text/plain; charset="UTF-8"
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org
Cc: Navid Emamdoost <emamd001@umn.edu>, LKML <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon, Sep 16, 2019 at 10:31 PM Navid Emamdoost
<navid.emamdoost@gmail.com> wrote:
>
> In rpmsg_eptdev_write_iter, if copy_from_iter_full fails the allocated
> buffer needs to be released.
>
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>

Would you please review this patch?

Thank you,

> ---
>  drivers/rpmsg/rpmsg_char.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/rpmsg/rpmsg_char.c b/drivers/rpmsg/rpmsg_char.c
> index eea5ebbb5119..c655074c07c2 100644
> --- a/drivers/rpmsg/rpmsg_char.c
> +++ b/drivers/rpmsg/rpmsg_char.c
> @@ -227,8 +227,10 @@ static ssize_t rpmsg_eptdev_write_iter(struct kiocb *iocb,
>         if (!kbuf)
>                 return -ENOMEM;
>
> -       if (!copy_from_iter_full(kbuf, len, from))
> -               return -EFAULT;
> +       if (!copy_from_iter_full(kbuf, len, from)) {
> +               ret = -EFAULT;
> +               goto free_kbuf;
> +       }
>
>         if (mutex_lock_interruptible(&eptdev->ept_lock)) {
>                 ret = -ERESTARTSYS;
> --
> 2.17.1
>


-- 
Navid.
