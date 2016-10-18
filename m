Return-Path: <bjorn.andersson@linaro.org>
Date: Tue, 18 Oct 2016 15:16:15 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 3/4] remoteproc: Add a sysfs interface for firmware
 and state
Message-ID: <20161018221615.GB19384@tuxbot>
References: <1476719341-11651-1-git-send-email-matt.redfearn@imgtec.com>
 <1476719341-11651-4-git-send-email-matt.redfearn@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476719341-11651-4-git-send-email-matt.redfearn@imgtec.com>
To: Matt Redfearn <matt.redfearn@imgtec.com>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Mon 17 Oct 08:49 PDT 2016, Matt Redfearn wrote:

> This patch adds a sysfs interface to rproc allowing the firmware name
> and processor state to be changed dynamically.
> 
> State was previously available in debugfs, and is replicated here. The
> firmware file allows retrieval of the running firmware name, and a new
> one to be specified at run time, so long as the remote processor has
> been stopped.
> 
> Signed-off-by: Matt Redfearn <matt.redfearn@imgtec.com>
> 
> ---
> 
> Changes in v2:
> Have firmware_store perform the necessary steps inline.
> Use sysfs_streq when dealing with writes to sysfs files
> 
[..]
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> new file mode 100644
> index 000000000000..afa9ca040a7e
> --- /dev/null
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -0,0 +1,155 @@
> +/*
> + * Remote Processor Framework
> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * version 2 as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/remoteproc.h>
> +
> +#include "remoteproc_internal.h"
> +
> +#define to_rproc(d) container_of(d, struct rproc, dev)
> +
> +/* Expose the loaded / running firmware name via sysfs */
> +static ssize_t firmware_show(struct device *dev, struct device_attribute *attr,
> +			  char *buf)
> +{
> +	struct rproc *rproc = to_rproc(dev);
> +
> +	return sprintf(buf, "%s\n", rproc->firmware);
> +}
> +
> +/* Change firmware name via sysfs */
> +static ssize_t firmware_store(struct device *dev,
> +			      struct device_attribute *attr,
> +			      const char *buf, size_t count)
> +{
> +	struct rproc *rproc = to_rproc(dev);
> +	char *p;
> +	int err, len = count;
> +
> +	err = mutex_lock_interruptible(&rproc->lock);
> +	if (err) {
> +		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, err);
> +		return -EINVAL;
> +	}
> +
> +	if (rproc->state != RPROC_OFFLINE) {
> +		dev_err(dev, "can't change firmware while running\n");
> +		err = -EBUSY;
> +		goto out;
> +	}
> +
> +	p = memchr(buf, '\n', count);
> +	if (p)
> +		len = p - buf;

I prefer the following variant:

len = strcspn(buf, '\n');

> +
> +	p = kstrndup(buf, len, GFP_KERNEL);
> +	if (!p) {
> +		err = -ENOMEM;
> +		goto out;
> +	}
> +
> +	kfree(rproc->firmware);
> +	rproc->firmware = p;
> +
> +	err = rproc_add_virtio_devices(rproc);

As of v4.9 rproc_add_virtio_devices() will only check to see if the
rproc driver has auto_boot set and if so boot the core. (Yes it needs a
new name)

Also I'm not sure if it's valid to provide a sysfs API like this and
sometimes setting firmware results in rproc_boot() and sometimes not...

So, just drop patch 2 in this series and drop the call to
rproc_add_virtio_devices() here.

> +out:
> +	mutex_unlock(&rproc->lock);
> +
> +	return err ? err : count;
> +}
> +static DEVICE_ATTR_RW(firmware);
> +
> +/*
> + * A state-to-string lookup table, for exposing a human readable state
> + * via sysfs. Always keep in sync with enum rproc_state
> + */
> +static const char * const rproc_state_string[] = {
> +	"offline",

Please be overly explicit here and make these:

	[RPROC_OFFLINE] = "offline",

> +	"suspended",
> +	"running",
> +	"crashed",
> +	"invalid",
> +};
> +

Regards,
Bjorn
