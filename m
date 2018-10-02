Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [PATCH 4/5] remoteproc: Introduce deny_sysfs_ops flag
References: <20180915003725.17549-1-s-anna@ti.com>
 <20180915003725.17549-5-s-anna@ti.com>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <36e85566-69e5-0a3a-edf1-6e0cfd8b388b@st.com>
Date: Tue, 2 Oct 2018 11:47:04 +0200
MIME-Version: 1.0
In-Reply-To: <20180915003725.17549-5-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Suman Anna <s-anna@ti.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Loic Pallardy <loic.pallardy@st.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Suman,

On 09/15/2018 02:37 AM, Suman Anna wrote:
> The remoteproc framework provides sysfs interfaces for changing
> the firmware name and for starting/stopping a remote processor
> through the sysfs files 'state' and 'firmware'. These interfaces
> are currently allowed irrespective of how the remoteprocs were
> booted (like remoteproc self auto-boot, remoteproc client-driven
> boot etc). These interfaces can adversely affect a remoteproc
> and its clients especially when a remoteproc is being controlled
> by a remoteproc client driver(s). Also, not all remoteproc
> drivers may want to support the sysfs interfaces by default.
> 
> Add support to deny the sysfs state/firmware change by introducing
> a state flag 'deny_sysfs_ops' that the individual remoteproc drivers
> can set based on their usage needs. The default behavior is to
> allow the sysfs operations as before.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> ---
>  drivers/remoteproc/remoteproc_sysfs.c | 8 ++++++++
>  include/linux/remoteproc.h            | 2 ++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_sysfs.c b/drivers/remoteproc/remoteproc_sysfs.c
> index ce93f4d710f3..b2d8c11b89d0 100644
> --- a/drivers/remoteproc/remoteproc_sysfs.c
> +++ b/drivers/remoteproc/remoteproc_sysfs.c
> @@ -36,6 +36,10 @@ static ssize_t firmware_store(struct device *dev,
>  	char *p;
>  	int err, len = count;
>  
> +	/* restrict sysfs operations if not allowed by remoteproc drivers */
> +	if (rproc->deny_sysfs_ops)
> +		return -EPERM;
> +
>  	err = mutex_lock_interruptible(&rproc->lock);
>  	if (err) {
>  		dev_err(dev, "can't lock rproc %s: %d\n", rproc->name, err);
> @@ -102,6 +106,10 @@ static ssize_t state_store(struct device *dev,
>  	struct rproc *rproc = to_rproc(dev);
>  	int ret = 0;
>  
> +	/* restrict sysfs operations if not allowed by remoteproc drivers */
> +	if (rproc->deny_sysfs_ops)
> +		return -EPERM;
> +
>  	if (sysfs_streq(buf, "start")) {
>  		if (rproc->state == RPROC_RUNNING)
>  			return -EBUSY;
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 75f9ca05b865..d21252b4f758 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -440,6 +440,7 @@ struct rproc_dump_segment {
>   * @table_sz: size of @cached_table
>   * @has_iommu: flag to indicate if remote processor is behind an MMU
>   * @auto_boot: flag to indicate if remote processor should be auto-started
> + * @deny_sysfs_ops: flag to not permit sysfs operations on state and firmware
>   * @dump_segments: list of segments in the firmware
>   */
>  struct rproc {
> @@ -472,6 +473,7 @@ struct rproc {
>  	size_t table_sz;
>  	bool has_iommu;
>  	bool auto_boot;
> +	bool deny_sysfs_ops;
>  	struct list_head dump_segments;
>  };

I'm concerned about granularity. Are we denying all write access to the
state and the firmware name?
Would it be interesting to have a bit-field to separately allow/deny
write access:
- to change the firmware name
- to start the firmware
- to stop the firmware
?

For instance, if firmware is stored in the file system, the auto_boot
mode is not functional (if remote proc in built-in). We could have to
allow user application to start the firmware, but deny to change the
firmware name or stop it.

Regards
Arnaud

>  
> 
