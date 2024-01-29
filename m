Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278B71534F9
	for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jan 2024 15:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706541462; cv=none; b=OmhAwkXoiQAA8Fui0F2+14gEt1A99hGQVwRCTNHOotGLyXv7KKpVXoHN25rdjbuAydRdVg8nRvD2VnKXquRSblsOiV/xKHZMzPdnmmYtp7MzJ3OxRTv6uualHNpV92wIT4OXGYIT4IInsgNHRerKG3UcjuD/6s5vCudaZY1JUMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706541462; c=relaxed/simple;
	bh=VYk2kDys0glDWMk0P7roTgZucENZXxmFY1OUmtkVmJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Akak1+QCPuoOB0CVZx5a4VNrfv+USQHMMcCybLQuZOLgDjryb0ipVYHmQUv4IBxaLG6o8d2FKV4tU6e1WXNESPgaWM02UYpwEHR1eREddOQ07jgjVgM2X9DSoza0raxPg3CkcA8J4aWC3vTEenTHSEThTV6ZS75hOKNU2+B5A8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kiD6PFLb; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kiD6PFLb"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-602cab8d7c9so30201817b3.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 29 Jan 2024 07:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706541459; x=1707146259; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5MB7A9ATBDbqpsaX+ySSekE4FzWm5nmsG8f0biE3UZk=;
        b=kiD6PFLbpoidhxUJoTiebE9iECJ54bl15yaI4ZqYjNNDKYJM3NdyhqHrX16l08Qsx7
         kjfzLk3SXatBf+9VaxrAXLIFkbr3G3uTHIHV5V42hHrJydKnyzjulN2GXJFbbL7lcP7y
         TOtUBzDfZHMthauxB5eSJsWAvzVuRSyL00omSrTaGPRv3b80bRDuokySymWmaBRfgbfK
         FP16mB6CczBflP6VqZVY8XrNocGFKLKXKirhg/K0LwPwvE/6cfp/Hx/DZvSROb/RFEyj
         WnxrcXU+b6CSUHYYWHk+S15pJyKGGykEHbvdHACc4EaFi4e8qb1GGXrDGGdrvhi52t6v
         Taxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706541459; x=1707146259;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5MB7A9ATBDbqpsaX+ySSekE4FzWm5nmsG8f0biE3UZk=;
        b=ACTDosrh6BRzjwntp7+u+i7p5Ke6yo3yHwQ51EO4HxTwab+lJIpbLzfy+KGOc4BAD4
         oGceLtBd0lzzMgiOe5nPVT8Q/vHs5h6F55W33AHm/s1/2S4GHR1fOGRQZknnfYKAo41W
         rWIGEcqp3MJcGenJaGs3WguHizOSwiMHmvECKKl3tBR4VygRv2ujy2CiQtKksJ/BHlfo
         ohhdeUoLHApGTfP2RcTF8ibK8oV02/mXdqQivIh5bhZPSnXcnfPsfbe3ItAmusA4e/z0
         Qrv2gSVMKJbqqb8wW92NAyPhykb+T+gzt+TS1DTq2124lF9a1X3O87WsmmxUTeQ0i5bT
         gKZg==
X-Gm-Message-State: AOJu0YxwbNHfhFiBHLUUBfPi5lLmvDcpMK5oIK921jWalAxrLwCEKVTZ
	2Q5Bfu0+2BsYJA4NYKZbeGNGoIOQeAsWAt1lLVxlhobezFY7kuJ9dfj4T4Nvu7GSNpy4yf4ZZua
	RyBBwcUzgMOiebL2qOMh2nUR/oJsz+R5fcgxszQ==
X-Google-Smtp-Source: AGHT+IH78q1nwygFDkOrWIMmiiOqu+94WGhjny51UtK7G2os6l1B4sEyC0mrhtNYMT1u+/g+5VZmFHg8vWtcGyCh4iE=
X-Received: by 2002:a81:99d5:0:b0:602:b375:380d with SMTP id
 q204-20020a8199d5000000b00602b375380dmr3586667ywg.80.1706541459045; Mon, 29
 Jan 2024 07:17:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129-x1e80100-remoteproc-v1-0-15d21ef58a4b@linaro.org> <20240129-x1e80100-remoteproc-v1-3-15d21ef58a4b@linaro.org>
In-Reply-To: <20240129-x1e80100-remoteproc-v1-3-15d21ef58a4b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 29 Jan 2024 17:17:28 +0200
Message-ID: <CAA8EJporoBQQtrRWL5SS4qwpmu0rF6UMpaZXQ5t-qdvoW53XOA@mail.gmail.com>
Subject: Re: [PATCH 3/3] remoteproc: qcom_q6v5_pas: Unload lite firmware on ADSP
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sibi Sankar <quic_sibis@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jan 2024 at 15:35, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> From: Sibi Sankar <quic_sibis@quicinc.com>
>
> The UEFI loads a lite variant of the ADSP firmware to support charging
> use cases. The kernel needs to unload and reload it with the firmware
> that has full feature support for audio. This patch arbitarily shutsdown
> the lite firmware before loading the full firmware.
>
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 083d71f80e5c..4f6940368eb4 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -39,6 +39,7 @@ struct adsp_data {
>         const char *dtb_firmware_name;
>         int pas_id;
>         int dtb_pas_id;
> +       int lite_pas_id;
>         unsigned int minidump_id;
>         bool auto_boot;
>         bool decrypt_shutdown;
> @@ -72,6 +73,7 @@ struct qcom_adsp {
>         const char *dtb_firmware_name;
>         int pas_id;
>         int dtb_pas_id;
> +       int lite_pas_id;
>         unsigned int minidump_id;
>         int crash_reason_smem;
>         bool decrypt_shutdown;
> @@ -210,6 +212,10 @@ static int adsp_load(struct rproc *rproc, const struct firmware *fw)
>         /* Store firmware handle to be used in adsp_start() */
>         adsp->firmware = fw;
>
> +       /* WIP: Shutdown the ADSP if it's running a lite version of the firmware*/

Why is it still marked as WIP?

> +       if (adsp->lite_pas_id)
> +               ret = qcom_scm_pas_shutdown(adsp->lite_pas_id);
> +
>         if (adsp->dtb_pas_id) {
>                 ret = request_firmware(&adsp->dtb_firmware, adsp->dtb_firmware_name, adsp->dev);
>                 if (ret) {
> @@ -693,6 +699,7 @@ static int adsp_probe(struct platform_device *pdev)
>         adsp->rproc = rproc;
>         adsp->minidump_id = desc->minidump_id;
>         adsp->pas_id = desc->pas_id;
> +       adsp->lite_pas_id = desc->lite_pas_id;
>         adsp->info_name = desc->sysmon_name;
>         adsp->decrypt_shutdown = desc->decrypt_shutdown;
>         adsp->region_assign_idx = desc->region_assign_idx;
> @@ -990,6 +997,7 @@ static const struct adsp_data x1e80100_adsp_resource = {
>         .dtb_firmware_name = "adsp_dtb.mdt",
>         .pas_id = 1,
>         .dtb_pas_id = 0x24,
> +       .lite_pas_id = 0x1f,
>         .minidump_id = 5,
>         .auto_boot = true,
>         .proxy_pd_names = (char*[]){
>
> --
> 2.34.1
>
>


-- 
With best wishes
Dmitry
