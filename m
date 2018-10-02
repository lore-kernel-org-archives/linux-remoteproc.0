Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH 1/5] remoteproc: Fix unbalanced boot with sysfs for no
 auto-boot rprocs
References: <20180915003725.17549-1-s-anna@ti.com>
 <20180915003725.17549-2-s-anna@ti.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <eb98b312-020b-60c4-627f-a916ad436e21@st.com>
Date: Tue, 2 Oct 2018 11:27:27 +0200
MIME-Version: 1.0
In-Reply-To: <20180915003725.17549-2-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Suman Anna <s-anna@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Loic Pallardy <loic.pallardy@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Suman,

On 09/15/2018 02:37 AM, Suman Anna wrote:
> The remoteproc core performs automatic boot and shutdown of a remote
> processor during rproc_add() and rproc_del() for remote processors
> supporting 'auto-boot'. The remoteproc devices not using 'auto-boot'
> require either a remoteproc client driver or a userspace client to
> use the sysfs 'state' variable to perform the boot and shutdown. The
> in-kernel client drivers hold the corresponding remoteproc driver
> module's reference count when they acquire a rproc handle through
> the rproc_get_by_phandle() API, but there is no such support for
> userspace applications performing the boot through sysfs interface.
> 
> The shutdown of a remoteproc upon removing a remoteproc platform
> driver is automatic only with 'auto-boot' and this can cause a
> remoteproc with no auto-boot to stay powered on and never freed
> up if booted using the sysfs interface without a matching stop,
> and when the remoteproc driver module is removed or unbound from
> the device. This will result in a memory leak as well as the
> corresponding remoteproc ida being never deallocated. Fix this
> by holding a module reference count for the remoteproc's driver
> during a sysfs 'start' and releasing it during the sysfs 'stop'
> operation.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/remoteproc_sysfs.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index 47be411400e5..2142b3ea726e 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -11,6 +11,7 @@
>   * GNU General Public License for more details.
>   */
>  
> +#include <linux/module.h>
>  #include <linux/remoteproc.h>
>  
>  #include "remoteproc_internal.h"
> @@ -100,14 +101,27 @@ static ssize_t state_store(struct device *dev,
>  		if (rproc->state == RPROC_RUNNING)
>  			return -EBUSY;
>  
> +		/*
> +		 * prevent underlying implementation from being removed
> +		 * when remoteproc does not support auto-boot
> +		 */
> +		if (!rproc->auto_boot &&
> +		    !try_module_get(dev->parent->driver->owner))
> +			return -EINVAL;
> +
>  		ret = rproc_boot(rproc);
> -		if (ret)
> +		if (ret) {
>  			dev_err(&rproc->dev, "Boot failed: %d\n", ret);
> +			if (!rproc->auto_boot)
> +				module_put(dev->parent->driver->owner);
> +		}
>  	} else if (sysfs_streq(buf, "stop")) {
>  		if (rproc->state != RPROC_RUNNING)
>  			return -EINVAL;
>  
>  		rproc_shutdown(rproc);
> +		if (!rproc->auto_boot)
> +			module_put(dev->parent->driver->owner);
>  	} else {
>  		dev_err(&rproc->dev, "Unrecognised option: %s\n", buf);
>  		ret = -EINVAL;
> 
Looks good for me, i tested on ST platform and did not detect any
regression.
Acked-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>

Regards
Arnaud
