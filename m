Return-Path: <s-anna@ti.com>
Subject: Re: [RESEND 1/2] remoteproc: replace bool from struct rproc by u8
References: <1565170879-3185-1-git-send-email-loic.pallardy@st.com>
 <1565170879-3185-2-git-send-email-loic.pallardy@st.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <5ef3cb58-76cf-512b-4c39-08f5b9e2d67f@ti.com>
Date: Wed, 7 Aug 2019 11:50:54 -0500
MIME-Version: 1.0
In-Reply-To: <1565170879-3185-2-git-send-email-loic.pallardy@st.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Loic Pallardy <loic.pallardy@st.com>, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, arnaud.pouliquen@st.com, benjamin.gaignard@linaro.org, fabien.dessenne@st.com
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Loic,

On 8/7/19 4:41 AM, Loic Pallardy wrote:
> Post [1] and checkpatch tool indicate that usage of bool type
> in structure is now no more allowed/advised.
> This patch replaces bool by unsigned char (u8) and reorders
> struct rproc fields to avoid padding.
> 
> [1] https://lkml.org/lkml/2017/11/21/384

Btw, that checkpatch warning has been removed and documentation
clarified in commit 7967656ffbfa ("coding-style: Clarify the
expectations around bool") added in 5.1 kernel.

I have actually switched to using bitfields on some of my patches
downstream because of the same checkpatch message, since we seem to have
a number of these fields, but that also requires updating all the field
values in various drivers to use 0 or 1 instead of the boolean values.

regards
Suman

> 
> Signed-off-by: Loic Pallardy <loic.pallardy@st.com>
> ---
>  include/linux/remoteproc.h | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
> index 16ad66683ad0..8cd22fecea61 100644
> --- a/include/linux/remoteproc.h
> +++ b/include/linux/remoteproc.h
> @@ -472,15 +472,15 @@ struct rproc_dump_segment {
>   * @index: index of this rproc device
>   * @crash_handler: workqueue for handling a crash
>   * @crash_cnt: crash counter
> - * @recovery_disabled: flag that state if recovery was disabled
>   * @max_notifyid: largest allocated notify id.
>   * @table_ptr: pointer to the resource table in effect
>   * @cached_table: copy of the resource table
>   * @table_sz: size of @cached_table
> - * @has_iommu: flag to indicate if remote processor is behind an MMU
> - * @auto_boot: flag to indicate if remote processor should be auto-started
>   * @dump_segments: list of segments in the firmware
>   * @nb_vdev: number of vdev currently handled by rproc
> + * @recovery_disabled: flag that state if recovery was disabled
> + * @has_iommu: flag to indicate if remote processor is behind an MMU
> + * @auto_boot: flag to indicate if remote processor should be auto-started
>   */
>  struct rproc {
>  	struct list_head node;
> @@ -505,15 +505,15 @@ struct rproc {
>  	int index;
>  	struct work_struct crash_handler;
>  	unsigned int crash_cnt;
> -	bool recovery_disabled;
>  	int max_notifyid;
>  	struct resource_table *table_ptr;
>  	struct resource_table *cached_table;
>  	size_t table_sz;
> -	bool has_iommu;
> -	bool auto_boot;
>  	struct list_head dump_segments;
>  	int nb_vdev;
> +	u8 recovery_disabled;
> +	u8 has_iommu;
> +	u8 auto_boot;
>  };
>  
>  /**
> 
