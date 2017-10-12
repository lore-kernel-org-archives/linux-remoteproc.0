Return-Path: <bjorn.andersson@linaro.org>
Date: Thu, 12 Oct 2017 11:26:24 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v3 1/6] remoteproc: qcom: mdt_loader: Make the firmware
 authentication optional
Message-ID: <20171012182624.GH1165@minitux>
References: <1504154734-12175-1-git-send-email-sricharan@codeaurora.org>
 <1504154734-12175-2-git-send-email-sricharan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1504154734-12175-2-git-send-email-sricharan@codeaurora.org>
To: Sricharan R <sricharan@codeaurora.org>
Cc: ohad@wizery.com, robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org, david.brown@linaro.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed 30 Aug 21:45 PDT 2017, Sricharan R wrote:

> qcom_mdt_load function loads the mdt type firmware and
> initialises the secure memory as well. Make the initialisation only
> when requested by the caller, so that the function can be used
> by self-authenticating remoteproc as well.
> 
> Signed-off-by: Sricharan R <sricharan@codeaurora.org>
> ---
>  drivers/soc/qcom/mdt_loader.c       | 70 +++++++++++++++++++++++++++++++------
>  include/linux/soc/qcom/mdt_loader.h |  3 ++
>  2 files changed, 62 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> index bd63df0..851f5d7 100644
> --- a/drivers/soc/qcom/mdt_loader.c
> +++ b/drivers/soc/qcom/mdt_loader.c
> @@ -86,9 +86,9 @@ ssize_t qcom_mdt_get_size(const struct firmware *fw)
>   *
>   * Returns 0 on success, negative errno otherwise.
>   */

This kerneldoc is now lacks @pas_init, but as it's just an internal
function and you have kerneldoc on the public functions I suggest that
you drop it.

> -int qcom_mdt_load(struct device *dev, const struct firmware *fw,
> -		  const char *firmware, int pas_id, void *mem_region,
> -		  phys_addr_t mem_phys, size_t mem_size)
> +static int __qcom_mdt_load(struct device *dev, const struct firmware *fw,
> +			   const char *firmware, int pas_id, void *mem_region,
> +			   phys_addr_t mem_phys, size_t mem_size, bool pas_init)

With this you have my Acked-by.

Regards,
Bjorn
