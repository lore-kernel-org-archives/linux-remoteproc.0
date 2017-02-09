Return-Path: <bjorn.andersson@linaro.org>
Date: Wed, 8 Feb 2017 17:55:04 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 4/4] remoteproc: core: don't allocate carveout if pa
 or da are defined
Message-ID: <20170209015504.GM27837@minitux>
References: <1485866156-6364-1-git-send-email-loic.pallardy@st.com>
 <1485866156-6364-5-git-send-email-loic.pallardy@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1485866156-6364-5-git-send-email-loic.pallardy@st.com>
To: Loic Pallardy <loic.pallardy@st.com>
Cc: ohad@wizery.com, lee.jones@linaro.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, patrice.chotard@st.com, hugues.fruchet@st.com, peter.griffin@linaro.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue 31 Jan 04:35 PST 2017, Loic Pallardy wrote:

> Remoteproc doesn't check if firmware requests fixed
> addresses for carveout regions.
> Current assumption is that platform specific driver is in
> charge of coprocessor specific memory region allocation and
> remoteproc core doesn't have to handle them.
> If a da or a pa is specified in firmware resource table, remoteproc
> core doesn't have to perform any allocation.
> Access to carveout will be done thanks to rproc_da_to_pa function,
> which will provide virtual address on carveout region allocated
> by platform specific driver.
> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
> No change since V1
> 
>  drivers/remoteproc/remoteproc_core.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 90b05c7..dd63ceed 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -622,6 +622,11 @@ static int rproc_handle_carveout(struct rproc *rproc,
>  	dev_dbg(dev, "carveout rsc: name: %s, da 0x%x, pa 0x%x, len 0x%x, flags 0x%x\n",
>  		rsc->name, rsc->da, rsc->pa, rsc->len, rsc->flags);
>  
> +	if (rsc->pa != FW_RSC_ADDR_ANY || rsc->da != FW_RSC_ADDR_ANY) {

For devices with an IOMMU it's valid to specify "da" and have the
allocated region mapped there. So this is not correct.

Regards,
Bjorn
