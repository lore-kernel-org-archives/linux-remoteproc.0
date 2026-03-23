Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D6F3ACA62
	for <linux-remoteproc@vger.kernel.org>; Mon, 23 Mar 2026 14:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276188; cv=pass; b=N7XB1Bc8apOwoCwrci8q3EfqESVCuHm4NB3E8+Um2PkzP081l78OuWeDGm+nHVFbzek8GnWnpXvXIQnWnbFooIJ7fjpfrSyEDzhrjFkHjFnw+BZQECtVzZ0kUEX0LUVM/vSzW2LckTSObwytwiFQSxoFsTYIKdx6wqP+Nqi19iM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276188; c=relaxed/simple;
	bh=+on5q4N8SL0w5EOH9rEDfmQSu2nzNibcQeALQEa6kg4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJJ1VDW6dwSU5enXChIL+YnHjeI6Vwf8iukaR63KdFS0w3mEJlQvVO4jrAzzAhbTYcdgRz65xi+LSuXhpVHxV7S4DR2UfXRu4oQI+KX9H9TKhg6fVDc+apkFZ0E4bJb7NjZsHMMcX787cpccpcQn4UPyOUgg5P6izc9/WtjczDk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EarLjfEg; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EarLjfEg"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9358bc9c50so39134066b.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Mar 2026 07:29:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774276185; cv=none;
        d=google.com; s=arc-20240605;
        b=aKe1vEQpYUZ2eW+JZWwdGX/otdv5ABQUKj6aHvZWqjryiOrKsuefqLxeN6iVjP5zHj
         qdUn6VPLtRfFZWNWRbyJ2D8X63Ckpn0/S9Y44WSH65wDGG7241i2n7Bd8g8ywowdB2Wr
         P4Keil3tZWwyERPDa0NpvUYr+eMXN4RGlV7PU42Hf8nyRWXyZlngha5C+YYHkVg6zEBr
         ORhB1PgcuH4kI/ZLyvtzezqdJXrmwT9kNG+68IIXijxPGs6gLMJyhNC+YVpJ5HNIyA1u
         ICS/y6qZ7ZJ9J78RsGvR0cp00WOWyswWemMs+Hgx+x6iqt/gyUbPb2oZrpVXDYohUtWg
         rRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        fh=95dEVVKrH2LQ5oK/nCWBSAnv1JukJjPVNRBTG8f+1Ps=;
        b=TYBhS41QwJG7KMgZ3jgc0bLlY3srR/tPu100r67xHlThE91lyzJ9NVGNiVK0+1ppOC
         zcxrCkkToiZU3RT9RROIcHUwmBnMpEbv+AASCUO7x4Lu4HXjidwislS+oAXzdIUnhgEc
         SuyIny43g+OkMSGa44MbRhlpJXs5PK94Bv/NbaMIbvEIepRDTzi+TxwS3J/Hj8HB7oKO
         XgXZNRuqqHl3fRW9c31WGUHy0rN+0RkwiMDdR37uOE+0MbTgxeqiz/R8hPHa6CnRsrxi
         yUEBCMnsl/Ry9xDO0EOio2e4IrF1RQmDIt0/Y/BUntwZiVn1Dh9PoRQ8J9L0ClIMarl4
         z88A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774276185; x=1774880985; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        b=EarLjfEgA8q0L+mwlFDSb/Jsya1AqkRGVOEPLdSMAJ77MX5lxnxT+QRFA0oAznGfEF
         2nN+mUJ0plLWWYiAPW/X1kXuZKOVozD0xKj2u2YsNGCv0YXdcpgmH3G00mjovvMWi1u+
         /AxLT5kjY7lPXfaIQ/4EbEPfCluifk1XH3imnJFze0Ftux+Ji82Nxqsb8txMGrYfFaTT
         93M5cbt8/BlNKpA2GbQ09bmrdbHGNBbSE+SKiH5g2ai09kT60GSOlzA7KnUI02sydvxx
         yJ75R0Og09ge7PwUlcRLj5WxOb470X98xhzXrScpCjYJmg7vW8Xl8LaVKgYzEi0ZyGyf
         w/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774276185; x=1774880985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HJ90V3WnYMZ+Bz1s0rTfRxBxtHCI8HjCYpnHgbscmPs=;
        b=oMYjHS6DJLCkiT+ypftOvLDYRRgiKZSv882wbdcfNKTO7OoSVQzVuT2NOLtGidI9td
         jvbuNX2p6777CWDMR/0RgVwtNeYmYecFAdp1vnRAqfLetXtndUVd4H0pxDAEORwW4/sK
         LpuqX9pNUxiWLjL+meYVH3kIRuoTt77BQjmpqsWTs0soMf9pyBpyBwC+WxJI1BjiEL04
         LvxbievR9FlLTYfcLj7BKaHTP/rFhGY2jdHV/tq1vZUUr79joHg5giFKfSZWb19HMLKh
         94oChjuKfwF64NBh2bSJXu/6wPdQZk+R7KnETnbATK+efVGLR7EBzNyqn32FusqoKE6l
         1YTA==
X-Forwarded-Encrypted: i=1; AJvYcCUJbDVuER25eVbINcKp4myQZ0Odr8uYEujrPmi1zX2Z8XwvV72rw37beUmTkCpSrO0BhYO4ZHjSlizEAlLMBnMf@vger.kernel.org
X-Gm-Message-State: AOJu0YyXdH6uh0fTc8H88IHTWvMnWxwdqU0qc+8LKhbMeNqsjrMWsqCm
	W5egAfHlQZ9koHpLdwtZkoKreOfs/20xjkPmYyW+iTplFbhTMXq+xubEFqNw/JzpS5tBgVnk/oL
	C6svXX3+oiPNKgeZvEH6WxYTo4OAx/KIykePjVhVfLw==
X-Gm-Gg: ATEYQzxGnXm0fvXcvrEggUeBTHsV2QpEmHQswhT/A7cZSEIuURaPAavk+WtzcvezbYa
	YiRljcY9oa0/S+RitOr674uyNfEKzi9TVWg0dZiFH8rjeo2pP7Us7xD8edRuloAe2eTc49nqwir
	UwxevJCsx08yI3nVLgPGjjdl941YraJDoYqtHqRMsAE2B2o9UsZJfBO+YuRk4LeciaxpeJPQwbj
	i+YBDZ2lPdyp4ygm/hAR+FDK+B0Ms4nw345luotwlQ+YTLbRkrRJI3uE1suUmaY28ERr00tz+Tl
	K6PuOTFhdFK7HH89PNZI/2E8qJdFJRsP1MnTDrAugg==
X-Received: by 2002:a17:907:a18b:b0:b98:2b20:6680 with SMTP id
 a640c23a62f3a-b982ee95138mr577158566b.0.1774276185012; Mon, 23 Mar 2026
 07:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 23 Mar 2026 08:29:33 -0600
X-Gm-Features: AQROBzDAtL1nQ4PFq47to0a6JE1kiVHOZBw70rBZKtJtzPk95r669W13VmBQzzg
Message-ID: <CANLsYkxVRDd941sVq9rdn_O0eDbDcVctPpKTACVi5vfYhzgYKQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] ASoC / rpmsg / remoteproc / soc: qcom: Constify
 buffer passed to send functions
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Mar 2026 at 06:37, Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> This got acks from Mathieu (remoteproc) and Mark (audio), so can we
> funnel everything via Qualcomm remoteproc tree?
>

I'm good with that.

> Dependencies / merging
> ======================
> Entire patchset is one logical chain, all further patches depend on
> previous ones, thus everything should be taken via same tree or shared
> between trees with tags.  Probably everything should go via ASoC with
> necessary acks.
>
> Changes in v3:
> - Subject fixes (Angelo)
> - Tags
> - Link to v2: https://patch.msgid.link/20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com
>
> Changes in v2:
> - New patch #5: media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
> - Rebase, add acks.
> - Link to v1: https://patch.msgid.link/20251130-rpmsg-send-const-v1-0-cb11c7e0a024@oss.qualcomm.com
>
> Description
> ===========
> The remoteproc and rpmsg send-like functions should not modify data
> being sent, so buffer should be marked as pointer to const.  This is not
> only self-documenting code but actually increases the actual safety and
> clearly documents who is the owner of passed buffer.
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (5):
>       remoteproc: mtk_scp_ipi: Constify buffer passed to scp_ipi_send()
>       remoteproc: mtk_scp: Constify buffer passed to scp_send_ipi()
>       rpmsg: Constify buffer passed to send API
>       ASoC: qcom:: Constify GPR packet being send over GPR interface
>       media: platform: mtk-mdp3: Constify buffer passed to mdp_vpu_sendmsg()
>
>  .../media/platform/mediatek/mdp3/mtk-mdp3-vpu.c    |  2 +-
>  drivers/remoteproc/mtk_scp.c                       |  2 +-
>  drivers/remoteproc/mtk_scp_ipi.c                   |  2 +-
>  drivers/rpmsg/mtk_rpmsg.c                          |  4 ++--
>  drivers/rpmsg/qcom_glink_native.c                  | 13 +++++++-----
>  drivers/rpmsg/qcom_smd.c                           | 10 +++++----
>  drivers/rpmsg/rpmsg_core.c                         |  8 ++++----
>  drivers/rpmsg/rpmsg_internal.h                     |  8 ++++----
>  drivers/rpmsg/virtio_rpmsg_bus.c                   | 24 ++++++++++++----------
>  drivers/soc/qcom/apr.c                             |  8 ++++----
>  include/linux/remoteproc/mtk_scp.h                 |  2 +-
>  include/linux/rpmsg.h                              | 17 +++++++--------
>  include/linux/rpmsg/mtk_rpmsg.h                    |  2 +-
>  include/linux/soc/qcom/apr.h                       |  4 ++--
>  sound/soc/qcom/qdsp6/audioreach.c                  |  6 +++---
>  sound/soc/qcom/qdsp6/audioreach.h                  |  4 ++--
>  sound/soc/qcom/qdsp6/q6apm.c                       |  3 ++-
>  sound/soc/qcom/qdsp6/q6apm.h                       |  2 +-
>  18 files changed, 65 insertions(+), 56 deletions(-)
> ---
> base-commit: 2360a9a195d2eae6f7d0cac2cbe920ae8a06c54f
> change-id: 20251130-rpmsg-send-const-ae216a1fbd8f
>
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
