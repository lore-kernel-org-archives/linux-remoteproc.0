Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA5D29D26B
	for <linux-remoteproc@vger.kernel.org>; Wed,  3 Dec 2025 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764753609; cv=none; b=D9UQaQ4ih5VUpt+e2tNiWlF0Ooom/sxVHN0UWOu+31CMRFxhfKXh08udPAe2vR/AVH0LSeBgUDeVK3vcMTRUxbGkQhw3KbS+nFXGFFlPWE2ydqb1vLgEOlsvcTTAFfl7UaVgo6gsC0ZZeycYVmC9Od2EjvU+n9YIVG1GG0+2ODU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764753609; c=relaxed/simple;
	bh=/N+3OH4zEXtSI0aT412tgrIES75Rk37HQHfGoGfZeF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnwoHC9x5/vkOUocTkVkpRt/gJp7pBQcnVlBI8VT2oS/+xbUUGFnB53oETAtq8D4Il5gdVkLr7D+7dBhaV5WUxDDhedXSJeRWERiUjXvspWmjcFd65Z077pPW39LLt2VdFkIwZzb/cB3UBT+VtYRHWJ+qdqWdCTr4pKO2G+BQn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XufypkaP; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XufypkaP"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78ab03c30ceso58783577b3.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 03 Dec 2025 01:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764753606; x=1765358406; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JslWvuiajcWzrBB46OuwbdFdQrLoISVONeMt83mMlyE=;
        b=XufypkaP+Gc719ecV1T63mtZ7b1fTRwBgr/t+3OAtkBqsIyfUfyNu69/IDm4ZqhBgq
         T4LS2fKDhMEPB1g6XMzxgzDfmlNHJb5yH47x9MnOIgmRrTdtD7SGlidQnC198Kmy5Hj3
         iKB4Yi48LxhGO/eADUduP8+BvJMzvYEmw0ffL3KbHGebRbdmnKv9bzNDDmdk4XIiICKC
         GW+1hyLnjqg+LQlaEif713CoTHjoD5rvKwsskB33XnnYd1d/BluIEsUNW/xDavfrkJ7i
         EIuvY4GxA8wibMGCxEYv7jIveMzP3HEE2qm8NHCjd4lB7DY3YLg7mPXU0WxGKkBeJfRi
         9drw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764753606; x=1765358406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JslWvuiajcWzrBB46OuwbdFdQrLoISVONeMt83mMlyE=;
        b=UEYg4Y2kRabFes/XhH8aUNXMny9OGaf8llHAB2vNivVclwk0B2iRXXu++Y/A7HIneM
         eUjA2cfGrLL3x4djKB0py4sTS6Uw4192fYEdTVBvmsZNpb1ScaFo+SvVebS4L1j9Wp4w
         9j+YvWnxf/6RqBJmlEPn9v5Jonkars5pemr1HUVxtgcZDZxq97lJJPntrHOEiNxk4J8o
         l2AbAskP/nrXvqPbEdEEu7NebnICXs/ewisv59gfDQf83JqSCbVK8PZ7kR/MyAXh2Bj3
         Mk0siBBUgBRMypuFfMkMRcnkqad7FrJrtB2K8BBOaJupwGzryC67FqdhZIW9L+ua56ya
         uXzQ==
X-Forwarded-Encrypted: i=1; AJvYcCWx3ipEd7Bye6LU5jBpyB+hPgNwH1KgYj1JC9pcNSPYETtWet4Qn3GmNKneFh3wvv/kWcxza+f3l7pPXbk8hEyE@vger.kernel.org
X-Gm-Message-State: AOJu0YxZtkLjWNuALfvQ01lZU9Se/400PEY6u+v3GMZz4GdmcTsBY14C
	QSPDHU+zpyZM1WxdlkNFncevx4lFe5GoLUd5HCVWC4YisCBxJ8AQe0xUSchW30KhmVeU5YNLTXK
	bkp5Cb61kvWguOo2/+bKtqmDk0lnEAV8bMpvGgop0QA==
X-Gm-Gg: ASbGncuG1EOWXNmc0G5nVbDryPDDiG96Ypk5WXiXGuSf8j1AY9KVnFUdf057dfg17ox
	Lctz7zD1qLX17rcV/hfVQ+p0/yRBKBiig5WfM7+V3SZ9qitA6ywgpNH3ks6j7TKm1iaElm8Mnuo
	yaZQ5oGqsAcq+Pk8qJvvXURyKlb3X0RLvHYJ794pWSfGjy6wAB2/GvvOaIDuT2kBIUwuxDNKckS
	d1ZKSU3swMiRA62dNCiwoQdbhJE5NCscpVOyo803btGoydzLD0ua0UcWMx8gZeWY+jntS3m
X-Google-Smtp-Source: AGHT+IFSzqL+IC9+QYrUw6EYhbf9scpk+H7xr3+affMiDHcP3tpwj6GRryyb2WZvwq6cVRpUhZVTIDh41o9Su6/LPuo=
X-Received: by 2002:a05:690c:6f02:b0:786:5620:fad3 with SMTP id
 00721157ae682-78c0beafb49mr13866407b3.11.1764753606355; Wed, 03 Dec 2025
 01:20:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251202-topic-8280_mxc-v2-0-46cdf47a829e@oss.qualcomm.com>
In-Reply-To: <20251202-topic-8280_mxc-v2-0-46cdf47a829e@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 3 Dec 2025 10:19:30 +0100
X-Gm-Features: AWmQ_bkBSmPeRpbLaqaQj8COOKMuWq6z818Jj9gJxp5lCrOKChpTcVbxhBjEFv4
Message-ID: <CAPDyKFq24afRddbS3Lbe2o+VYg2wfKaUJ-eHmWk7BkjjJ3mpcQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Define VDD_MXC for SC8280XP
To: Konrad Dybcio <konradybcio@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Johan Hovold <johan+linaro@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Dec 2025 at 18:36, Konrad Dybcio <konradybcio@kernel.org> wrote:
>
> This has somehow been omitted, leading to potentially stale votes.
> On the flip side, the domain will now be powered off, which will
> uncover any omissions we've made in the DTs so far.
>
> Reasonably tested on an x13s without pd_ignore_unused (camera still
> works).
>
> Video (not upstream right now) will also need this connection.
>
> This series defines VDD_MXC and wires it up to consumers.
>
> pmdomain patches extracted from:
> https://lore.kernel.org/linux-arm-msm/20250728-topic-gpucc_power_plumbing-v1-0-09c2480fe3e6@oss.qualcomm.com
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

For the series, please add:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Bjorn, then I assume you will pick this up for fixes - or let me know
if you prefer another route.

Kind regards
Uffe

> ---
> Changes in v2:
> - Remove the CAM_CC bits (thanks Imran for pointing that out, I was
>   beyond sure this also applied to this SoC)
> - Drop the applied rproc dt-bindings patch
> - Pick up tags as appropriate
> - Link to v1: https://lore.kernel.org/r/20251104-topic-8280_mxc-v1-0-df545af0ef94@oss.qualcomm.com
>
> ---
> Konrad Dybcio (3):
>       dt-bindings: power: qcom,rpmpd: Add SC8280XP_MXC_AO
>       pmdomain: qcom: rpmhpd: Add MXC to SC8280XP
>       arm64: dts: qcom: sc8280xp: Add missing VDD_MXC links
>
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi  | 16 ++++++++++++----
>  drivers/pmdomain/qcom/rpmhpd.c          |  4 ++++
>  include/dt-bindings/power/qcom,rpmhpd.h |  1 +
>  3 files changed, 17 insertions(+), 4 deletions(-)
> ---
> base-commit: 47b7b5e32bb7264b51b89186043e1ada4090b558
> change-id: 20251104-topic-8280_mxc-e92cd1c31010
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
