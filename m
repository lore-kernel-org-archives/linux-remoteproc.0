Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH] remoteproc: Add a sysfs interface for name
References: <20190809222057.13924-1-s-anna@ti.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <01cf27f8-c586-5a9e-c361-082bb1facbb4@st.com>
Date: Tue, 27 Aug 2019 18:21:45 +0200
MIME-Version: 1.0
In-Reply-To: <20190809222057.13924-1-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Suman Anna <s-anna@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Matt Redfearn <matt.redfearn@mips.com>, Loic Pallardy <loic.pallardy@st.com>, Fabien Dessenne <fabien.dessenne@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Suman,

Acked-by:Arnaud POULIQUEN <arnaud.pouliquen@st.com>

Thanks,
Arnaud

On 8/10/19 12:20 AM, Suman Anna wrote:
> This patch adds a sysfs interface that provides the name of the
> remote processor to userspace. This allows the userspace to identify
> a remote processor as the remoteproc devices themselves are created
> based on probe order and can change from one boot to another or
> at runtime.
> 
> The name is made available in debugfs originally, and is being
> retained for now. This can be cleaned up after couple of releases
> once users get familiar with the new interface.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>   Documentation/ABI/testing/sysfs-class-remoteproc | 10 ++++++++++
>   drivers/remoteproc/remoteproc_sysfs.c            | 11 +++++++++++
>   2 files changed, 21 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-remoteproc b/Documentation/ABI/testing/sysfs-class-remoteproc
> index c3afe9fab646..36094fbeb974 100644
> --- a/Documentation/ABI/testing/sysfs-class-remoteproc
> +++ b/Documentation/ABI/testing/sysfs-class-remoteproc
> @@ -48,3 +48,13 @@ Description:	Remote processor state
>   
>   		Writing "stop" will attempt to halt the remote processor and
>   		return it to the "offline" state.
> +
> +What:		/sys/class/remoteproc/.../name
> +Date:		August 2019
> +KernelVersion:	5.4
> +Contact:	Suman Anna <s-anna@ti.com>
> +Description:	Remote processor name
> +
> +		Reports the name of the remote processor. This can be used by
> +		userspace in exactly identifying a remote processor and ease
> +		up the usage in modifying the 'firmware' or 'state' files.
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index fa4131930106..7f8536b73295 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -113,9 +113,20 @@ static ssize_t state_store(struct device *dev,
>   }
>   static DEVICE_ATTR_RW(state);
>   
> +/* Expose the name of the remote processor via sysfs */
> +static ssize_t name_show(struct device *dev, struct device_attribute *attr,
> +			 char *buf)
> +{
> +	struct rproc *rproc = to_rproc(dev);
> +
> +	return sprintf(buf, "%s\n", rproc->name);
> +}
> +static DEVICE_ATTR_RO(name);
> +
>   static struct attribute *rproc_attrs[] = {
>   	&dev_attr_firmware.attr,
>   	&dev_attr_state.attr,
> +	&dev_attr_name.attr,
>   	NULL
>   };
>   
> 
