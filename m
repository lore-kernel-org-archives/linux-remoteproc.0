Return-Path: <evgreen@chromium.org>
Return-Path: <evgreen@chromium.org>
MIME-Version: 1.0
References: <20200415071619.6052-1-sibis@codeaurora.org> <20200415071619.6052-2-sibis@codeaurora.org>
In-Reply-To: <20200415071619.6052-2-sibis@codeaurora.org>
From: Evan Green <evgreen@chromium.org>
Date: Mon, 20 Apr 2020 11:53:36 -0700
Message-ID: <CAE=gft4NK8vXGwJFEtXwKroKfoSO8wPxq=fv35AVC6vSQk02ig@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] remoteproc: qcom_q6v5_mss: Remove unused
 q6v5_da_to_va function
Content-Type: text/plain; charset="UTF-8"
To: Sibi Sankar <sibis@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-remoteproc@vger.kernel.org, Ohad Ben Cohen <ohad@wizery.com>
List-ID: <linux-remoteproc@vger.kernel.org>

On Wed, Apr 15, 2020 at 12:16 AM Sibi Sankar <sibis@codeaurora.org> wrote:
>
> Remove unsed q6v5_da_to_va function as the mss driver uses a per segment
> dump function.
>
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_mss.c | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
> index b781fc8de3597..6a19e0e77236e 100644
> --- a/drivers/remoteproc/qcom_q6v5_mss.c
> +++ b/drivers/remoteproc/qcom_q6v5_mss.c
> @@ -196,7 +196,6 @@ struct q6v5 {
>
>         phys_addr_t mpss_phys;
>         phys_addr_t mpss_reloc;
> -       void *mpss_region;

Hm, this doesn't build for me on our Chrome tree:

  CC [M]  drivers/remoteproc/qcom_q6v5_mss.o
/mnt/host/source/src/third_party/kernel/v5.4/drivers/remoteproc/qcom_q6v5_mss.c:1118:16:
error: no member named 'mpss_region' in 'struct q6v5'
                ptr = qproc->mpss_region + offset;
                      ~~~~~  ^
/mnt/host/source/src/third_party/kernel/v5.4/drivers/remoteproc/qcom_q6v5_mss.c:1520:9:
error: no member named 'mpss_region' in 'struct q6v5'
        qproc->mpss_region = devm_ioremap_wc(qproc->dev,
qproc->mpss_phys, qproc->mpss_size);
        ~~~~~  ^
/mnt/host/source/src/third_party/kernel/v5.4/drivers/remoteproc/qcom_q6v5_mss.c:1521:14:
error: no member named 'mpss_region' in 'struct q6v5'
        if (!qproc->mpss_region) {
             ~~~~~  ^
