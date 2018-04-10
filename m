Return-Path: <arnaud.pouliquen@st.com>
Subject: Re: [GIT PULL] remoteproc updates for v4.17
References: <20180409222546.GD17344@builder>
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Message-ID: <d279e70d-e730-39dc-a576-393e4183cea8@st.com>
Date: Tue, 10 Apr 2018 10:50:13 +0200
MIME-Version: 1.0
In-Reply-To: <20180409222546.GD17344@builder>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
To: Bjorn Andersson <bjorn.andersson@linaro.org>, "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org; linux-arm-msm"@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hi Bjorn,

On 04/10/2018 12:25 AM, Bjorn Andersson wrote:
> The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:
> 
>   Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)
> 
> are available in the Git repository at:
> 
>   git://github.com/andersson/remoteproc tags/rproc-v4.17
> 
> for you to fetch changes up to 730b2ad8f72898029160a6832141ba954122a0c8:
> 
>   remoteproc: fix null pointer dereference on glink only platforms (2018-04-05 22:53:16 -0700)
> 
> ----------------------------------------------------------------
> remoteproc updates for v4.17
> 
> This adds support for generating coredumps for remoteprocs using
> devcoredump, adds the Qualcomm sysmon driver for intra-remoteproc crash
> handling and a number of fixes in Qualcomm and IMX drivers.
> 
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       soc: qcom: qmi: add CONFIG_NET dependency
> 
> Bjorn Andersson (5):
>       remoteproc: Rename "load_rsc_table" to "parse_fw"
>       soc: qcom: mdt-loader: Return relocation base
>       remoteproc: Pass type of shutdown to subdev remove

I haven't seen the V6 associated to this patch, did i miss it?

look like this patch is not good.
there is a parameter name error in remote_proc.h and logic seems
inversed in remote_proc.c

I will send a fix following this mail( FYI I'm not able to test the fix
on my side...)

Regards
Arnaud

>       remoteproc: qcom: Introduce sysmon
>       samples: Introduce Qualcomm QMI sample client
> 
> Christophe JAILLET (3):
>       remoteproc: imx_rproc: Fix an error handling path in 'imx_rproc_probe()'
>       remoteproc: imx_rproc: Re-use existing error handling path in 'imx_rproc_probe()'
>       remoteproc: imx_rproc: Slightly simplify code in 'imx_rproc_probe()'
> 
> Jitendra Sharma (1):
>       remoteproc: Remove null character write of shared mem
> 
> Sarangdhar Joshi (2):
>       remoteproc: Add remote processor coredump support
>       remoteproc: qcom: Register segments for core dump
> 
> Sibi Sankar (1):
>       remoteproc: fix null pointer dereference on glink only platforms
> 
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c        |   4 +-
>  drivers/media/platform/qcom/venus/firmware.c |   2 +-
>  drivers/remoteproc/Kconfig                   |  19 +
>  drivers/remoteproc/Makefile                  |   1 +
>  drivers/remoteproc/imx_rproc.c               |  23 +-
>  drivers/remoteproc/qcom_adsp_pil.c           |  20 +-
>  drivers/remoteproc/qcom_common.c             |  56 ++-
>  drivers/remoteproc/qcom_common.h             |  23 +
>  drivers/remoteproc/qcom_q6v5_pil.c           |   9 +-
>  drivers/remoteproc/qcom_sysmon.c             | 579 +++++++++++++++++++++++++
>  drivers/remoteproc/qcom_wcnss.c              |  11 +-
>  drivers/remoteproc/remoteproc_core.c         | 152 ++++++-
>  drivers/remoteproc/remoteproc_internal.h     |   7 +-
>  drivers/soc/qcom/Kconfig                     |   2 +-
>  drivers/soc/qcom/mdt_loader.c                |   7 +-
>  include/linux/remoteproc.h                   |  27 +-
>  include/linux/soc/qcom/mdt_loader.h          |   3 +-
>  samples/Kconfig                              |  10 +
>  samples/Makefile                             |   2 +-
>  samples/qmi/Makefile                         |   1 +
>  samples/qmi/qmi_sample_client.c              | 622 +++++++++++++++++++++++++++
>  21 files changed, 1524 insertions(+), 56 deletions(-)
>  create mode 100644 drivers/remoteproc/qcom_sysmon.c
>  create mode 100644 samples/qmi/Makefile
>  create mode 100644 samples/qmi/qmi_sample_client.c
> --
> To unsubscribe from this list: send the line "unsubscribe linux-remoteproc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
