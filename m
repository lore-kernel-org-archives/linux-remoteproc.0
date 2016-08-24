Return-Path: <pujag@codeaurora.org>
Subject: Re: [PATCH 2/4] firmware: qcom: scm: add iommu scm calls for pg table
References: <1471622000-1906-1-git-send-email-stanimir.varbanov@linaro.org>
 <1471622000-1906-3-git-send-email-stanimir.varbanov@linaro.org>
From: "Gupta, Puja" <pujag@codeaurora.org>
Message-ID: <14e4872a-7775-4221-140a-e08d28ae9098@codeaurora.org>
Date: Wed, 24 Aug 2016 11:35:29 -0700
MIME-Version: 1.0
In-Reply-To: <1471622000-1906-3-git-send-email-stanimir.varbanov@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>, Andy Gross <andy.gross@linaro.org>, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: Rob Clark <robdclark@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On 8/19/2016 8:53 AM, Stanimir Varbanov wrote:
> Those two scm calls are used to get the size of secure iommu
> page table and to pass physical memory address for this page
> table. The calls are used by remoteproc venus driver to load
> the firmware.
Do we really need these additional scm calls for venus? why can't we 
just reuse existing __qcom_scm_pas_mem_setup() call?
> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> ---
>   drivers/firmware/qcom_scm-64.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>   drivers/firmware/qcom_scm.c    | 12 ++++++++++++
>   drivers/firmware/qcom_scm.h    | 11 +++++++++++
>   include/linux/qcom_scm.h       |  3 +++
>   4 files changed, 68 insertions(+)
>
> diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
> index 68484ea2aa51..ffcfbb31ae7a 100644
> --- a/drivers/firmware/qcom_scm-64.c
> +++ b/drivers/firmware/qcom_scm-64.c
> @@ -374,3 +374,45 @@ int __qcom_scm_video_set_state(struct device *dev, u32 state, u32 spare)
>   
>   	return ret ? : res.a1;
>   }
> +
> +int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
> +				      size_t *size)
> +{
> +	struct qcom_scm_desc desc = {0};
> +	struct arm_smccc_res res;
> +	int ret;
> +
> +	desc.args[0] = spare;
> +	desc.arginfo = QCOM_SCM_ARGS(1);
> +
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
> +			    QCOM_SCM_IOMMU_SECURE_PTBL_SIZE, &desc, &res);
> +
> +	if (size)
> +		*size = res.a1;
> +
> +	return ret ? : res.a2;
> +}
> +
> +int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr, u32 size,
> +				      u32 spare)
> +{
> +	struct qcom_scm_desc desc = {0};
> +	struct arm_smccc_res res;
> +	int ret;
> +
> +	desc.args[0] = addr;
> +	desc.args[1] = size;
> +	desc.args[2] = spare;
> +	desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_RW, QCOM_SCM_VAL,
> +				     QCOM_SCM_VAL);
> +
> +	ret = qcom_scm_call(dev, QCOM_SCM_SVC_MP,
> +			    QCOM_SCM_IOMMU_SECURE_PTBL_INIT, &desc, &res);
> +
> +	/* the pg table has been initialized already, ignore the error */
> +	if (ret == -EPERM)
> +		ret = 0;
> +
> +	return ret;
> +}
> diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
> index 3b0e31c48639..aa77d31b885c 100644
> --- a/drivers/firmware/qcom_scm.c
> +++ b/drivers/firmware/qcom_scm.c
> @@ -333,6 +333,18 @@ int qcom_scm_video_set_state(u32 state, u32 spare)
>   }
>   EXPORT_SYMBOL(qcom_scm_video_set_state);
>   
> +int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size)
> +{
> +	return __qcom_scm_iommu_secure_ptbl_size(__scm->dev, spare, size);
> +}
> +EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_size);
> +
> +int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare)
> +{
> +	return __qcom_scm_iommu_secure_ptbl_init(__scm->dev, addr, size, spare);
> +}
> +EXPORT_SYMBOL(qcom_scm_iommu_secure_ptbl_init);
> +
>   static int qcom_scm_probe(struct platform_device *pdev)
>   {
>   	struct qcom_scm *scm;
> diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
> index 4830559b2639..edeb0038e5fc 100644
> --- a/drivers/firmware/qcom_scm.h
> +++ b/drivers/firmware/qcom_scm.h
> @@ -58,8 +58,17 @@ extern int  __qcom_scm_pas_auth_and_reset(struct device *dev, u32 peripheral);
>   extern int  __qcom_scm_pas_shutdown(struct device *dev, u32 peripheral);
>   extern int  __qcom_scm_pas_mss_reset(struct device *dev, bool reset);
>   
> +#define QCOM_SCM_SVC_MP			0xc
> +#define QCOM_SCM_IOMMU_SECURE_PTBL_SIZE	3
> +#define QCOM_SCM_IOMMU_SECURE_PTBL_INIT	4
> +extern int __qcom_scm_iommu_secure_ptbl_size(struct device *dev, u32 spare,
> +					     size_t *size);
> +extern int __qcom_scm_iommu_secure_ptbl_init(struct device *dev, u64 addr,
> +					     u32 size, u32 spare);
> +
>   /* common error codes */
>   #define QCOM_SCM_V2_EBUSY	-12
> +#define QCOM_SCM_NOT_PERMITTED	-8
>   #define QCOM_SCM_ENOMEM		-5
>   #define QCOM_SCM_EOPNOTSUPP	-4
>   #define QCOM_SCM_EINVAL_ADDR	-3
> @@ -81,6 +90,8 @@ static inline int qcom_scm_remap_error(int err)
>   		return -ENOMEM;
>   	case QCOM_SCM_V2_EBUSY:
>   		return -EBUSY;
> +	case QCOM_SCM_NOT_PERMITTED:
> +		return -EPERM;
>   	}
>   	return -EINVAL;
>   }
> diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
> index 2ece81a6b078..a8fb98c36cce 100644
> --- a/include/linux/qcom_scm.h
> +++ b/include/linux/qcom_scm.h
> @@ -48,4 +48,7 @@ extern u32 qcom_scm_get_version(void);
>   
>   extern int qcom_scm_video_set_state(u32 state, u32 spare);
>   
> +extern int qcom_scm_iommu_secure_ptbl_size(u32 spare, size_t *size);
> +extern int qcom_scm_iommu_secure_ptbl_init(u64 addr, u32 size, u32 spare);
> +
>   #endif
Puja
