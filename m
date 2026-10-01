Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321B241D11F
	for <linux-remoteproc@vger.kernel.org>; Thu,  1 Oct 2026 08:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790843910; cv=none; b=kNtwqkxlZCnLsVbGLIhb5P1EJsVbyMtivNOYi0m//62D4fg2e2R1uf7hMnDO/XSOxh3BLDhqr1rcYYb7RtRk3gDool+Gcy866h3+jRICosfI+XT9FHczC4mBwfRGH/NkvWfYQ3FGAyw7tlMYQ3TnTz8d5i9Fb5x/tHCWssDs5og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790843910; c=relaxed/simple;
	bh=NJBH9/Cuky1ZdSB2IwXB3IwQ+0259U9vIfeSjDYAFOo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0NfPFOGQ4bPoq5NGtwYWAkdh3MD0yEq0r/1xOJHiF8srsN5SOEeVWlhH5DYUrAimFQyWI0S9kQXQQcVeBqmoe/Z6RKvbtjv0OnFZkolk/pc/0kJet6B1AZljSpNq7dUtrrdyX2qLFodFWi6eR/q9cE5BT32xUK/6PtOQhkJnvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CJdR9k1n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CJdR9k1n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8D01F008A3
	for <linux-remoteproc@vger.kernel.org>; Thu,  1 Oct 2026 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790843908;
	bh=1mlI7eCbOHta9+T200ctjAiyq0mkMCIM7oHWkQJ9H50=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=CJdR9k1nB8B2pGCkOMihcUbnsJNBPDNSGgrm49fMHvzyFRObRk7dfu+h4Y6AcCkMD
	 s1yy8y/3NXo1SE/EYW1FzdkZzFTzy4jZkSNX6FTU+ONkMbK1pFIBIgRf3oMFj26xHJ
	 yXB8EJd5M8VgKk7/cj2V3DPZbuolO4IBosLGRVuS/+7thH+ra6kBKcE4w727nUbKe5
	 khOIhgq6ypwa+57XdiYyJtGO26a75DjTMgkWZOmdPbxF8N9bNHWzRHg8KqitJ0I/JL
	 dJLdF/h0XS2O4IplIxeRKdkqPRVdds7jMx21pYlzqOsRXTgQSiEXInqNmyY2zGD/NQ
	 BykRe1bVLLiAQ==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a77da28307so11856201fa.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 01 Oct 2026 01:38:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByjqvH3PE4mU6TlxSpDhmh5u2e/wHP2wHwG4+p4MxWBgjCircXm8XUqHwQ2HTTqnL9KyC7DdqRMm23pKAgMWDmd@vger.kernel.org
X-Gm-Message-State: AFq9FYLDr2Pmbm6wp39bpp04yF9KULre78xX0nV8tIqnGUSkIldflTAl
	DlF5nTr1mgdEZ8E89sXbnYszDbFOn1ps2qoBbblEP341NkR64PZfu2CfSgQMpfKRhHUsR8puVXz
	JpZVmSm5sx8m3Gg/edOy/o1JcwroKrsPZbmLCs8yvqg==
X-Received: by 2002:a2e:be9d:0:b0:3a6:5951:c0b8 with SMTP id
 38308e7fff4ca-3a7792530d4mr10672311fa.19.1790843907345; Thu, 01 Oct 2026
 01:38:27 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 11:38:24 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 11:38:24 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930020745.1940933-1-shengchao.guo@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 11:38:24 +0300
X-Gmail-Original-Message-ID: <CAMRc=MfBfcRKHVoGDUViLEftEaMXP8x+25r-7dWgvA9yVdDTtQ@mail.gmail.com>
X-Gm-Features: AclHuK9-uNXzyKt8BCmk4U_e3Igbon-NNMUoMOO6zAsq98gB4Oj4BJ9fltTnFPQ
Message-ID: <CAMRc=MfBfcRKHVoGDUViLEftEaMXP8x+25r-7dWgvA9yVdDTtQ@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: qcom_q6v5_pas: Drop early_boot flag for Nord ADSP
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Sep 2026 04:07:45 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> Qualcomm NHLOS team changes XBL for Nord IOT/Embedded variant, leaving
> ADSP to be powered up by Linux remoteproc, so that Nord IQ10 Qualcomm
> Linux (QLI) behavior gets aligned with IQ8/9. Drop early_boot flag from
> Nord ADSP for that purpose.
>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_q6v5_pas.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> index 2e1e39826ffa..9e7fb5c5610e 100644
> --- a/drivers/remoteproc/qcom_q6v5_pas.c
> +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> @@ -1582,7 +1582,6 @@ static const struct qcom_pas_data nord_adsp_resource = {
>  	.dtb_pas_id = 36,
>  	.minidump_id = 5,
>  	.auto_boot = true,
> -	.early_boot = true,
>  	.proxy_pd_names = (char*[]){
>  		"cx",
>  		"mx",
> --
> 2.43.0
>
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
