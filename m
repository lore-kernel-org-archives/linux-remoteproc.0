Return-Path: <robdclark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170628215323.5658-1-bjorn.andersson@linaro.org>
References: <20170628215323.5658-1-bjorn.andersson@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 29 Jun 2017 19:06:47 -0400
Message-ID: <CAF6AEGuenaCJk+BgKJ4KBMdqs4mJskWA3Y8FVms3gpBeFsJGew@mail.gmail.com>
Subject: Re: [PATCH v2] rpmsg: Make modalias work for DeviceTree based devices
Content-Type: text/plain; charset="UTF-8"
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Jun 28, 2017 at 5:53 PM, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
> When rpmsg devices are expected to be matched based on their compatible
> the modalias should reflect this, so that module autoloading has a
> chance to match and load the appropriate module.
>
> Tested-by: Rob Clark <robdclark@gmail.com>
> Reported-by: Rob Clark <robdclark@gmail.com>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

and also probably:

Cc: <stable@vger.kernel.org>


> ---
>
> Changes since v1:
> - Also update rpmsg_uevent()
>
>  drivers/rpmsg/rpmsg_core.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/drivers/rpmsg/rpmsg_core.c b/drivers/rpmsg/rpmsg_core.c
> index ad3d2a9df287..067650c5bcb6 100644
> --- a/drivers/rpmsg/rpmsg_core.c
> +++ b/drivers/rpmsg/rpmsg_core.c
> @@ -343,6 +343,11 @@ static ssize_t modalias_show(struct device *dev,
>                              struct device_attribute *attr, char *buf)
>  {
>         struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> +       ssize_t len;
> +
> +       len = of_device_modalias(dev, buf, PAGE_SIZE);
> +       if (len != -ENODEV)
> +               return len;
>
>         return sprintf(buf, RPMSG_DEVICE_MODALIAS_FMT "\n", rpdev->id.name);
>  }
> @@ -387,6 +392,11 @@ static int rpmsg_dev_match(struct device *dev, struct device_driver *drv)
>  static int rpmsg_uevent(struct device *dev, struct kobj_uevent_env *env)
>  {
>         struct rpmsg_device *rpdev = to_rpmsg_device(dev);
> +       int ret;
> +
> +       ret = of_device_uevent_modalias(dev, env);
> +       if (ret != -ENODEV)
> +               return ret;
>
>         return add_uevent_var(env, "MODALIAS=" RPMSG_DEVICE_MODALIAS_FMT,
>                                         rpdev->id.name);
> --
> 2.12.0
>
