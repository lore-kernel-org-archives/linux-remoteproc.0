Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FB4209F4F
	for <linux-remoteproc@vger.kernel.org>; Mon,  2 Dec 2024 15:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733153091; cv=none; b=LTIZFz60Il1PYBMJPDmNIct/qr0oaFzAHLdG3xEsZpQlrl7bgsVDuFDugzPv8Z1lU/PDAN69kPeh93GksIxsHD7MBqLT3ocg0acsnTbK2Nkrarp+2ajEdg4OK9LXg4ScSCBGCgODrh8Swih47xl9Zfx7Buhc3tlfOumHfqD2kk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733153091; c=relaxed/simple;
	bh=goFeMCUVRbDjipThdghVVJLskLf8H473+GNXYnXXrDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lQnfpzMqPohNHqL0ENasbZwQmPYihRBRADr53BFpGMHksRMNtfiVJ22fdedvB1hcD6bBmylwj5hCv02Jvqe/0Og1z0zDtnDMVgk+3c3zuXEAVyx8/P4U6hW/w1ZCFPDdnW0f8MaFFDQW4uruO60UqD/3rgn99tDyHpNnX1hDVOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uRx6VuxM; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uRx6VuxM"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e3983426f80so2923008276.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 02 Dec 2024 07:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733153086; x=1733757886; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=05ZXtxtYDYApb+lIzc95yV2LA74LDricN9fUjzTVsRg=;
        b=uRx6VuxMhqjU5kzREUBVrmyWJSJ7t6VMUn63IrxrbKfo9zn62de77W8cHQYI1pZNTb
         +Zf2y+HArTa8UNB7E0w4Sv93LqC/jOfvYSZvfhPTmZs1Hm/pEXeobFAd+FCNtGULtsCC
         vRGSH43uofb1IDl+y0iRlmNSWBsOSa+b10ouag4h2ikswTJEuh+DIixdHGtOUEwl7JCn
         a9t7QKqJ+YDq1wEn2s9ViNVOGoA5L1waoMBg5zdknUGpgn4AyuH3L5gxmTChIvDQNjX9
         npjRvDIQcRyjJ88CRS9jyg/86RMeV+KQzJCzexa74VLy3Xq2ye1HPCUwi16MzhDQ6Gqd
         Uflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153087; x=1733757887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05ZXtxtYDYApb+lIzc95yV2LA74LDricN9fUjzTVsRg=;
        b=MdXXeEDYXak5xWBc2ahYqQauzylpS3l/IOhRxt7Nw3IADfzRbwn7EBh+0b1RX4Fb3L
         bX9I3zQJqIYC0FQaP+s6TSYPGO+kiHCL0fDPVeQPKuETbVibVm2ndW+KEUeFZn8zRfPT
         79KDe+Atw6Vqf/3i32rj0/hVgzy93CpNfDu5WJ1nEwByhuCbfkMl69KnBQM3mVEJ+916
         H/O+YCZ/pT4p1ArmL8k477rtCwwsNn2pmrayEFOhOAbxy1HNJuTdJ5jexTw/Rnhp3I59
         +GXYgqo7b7sJO6AdxLoI6I7N4Y/3KDGCaPAbVAvGJsp9QpbXbOD0zesUOA3vwdhs3dml
         Xl1g==
X-Forwarded-Encrypted: i=1; AJvYcCVpA+mZcjSBQZ0h/0SuXUq5wp90eI/U0ivSXEdccKb28tgFMNOH+a6c72+mxrNC90jGDaJbVMGO+wInvp3zkhJE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw73n78dFPdheQr2teZfQhWz9o09y+mnrFeTXEAMWSrGu419tbu
	VcWYFW4sR/f0ec+GoZJZHfjTz6xmbYMjY5V9h0Hovox7cqnJ0TcMi0OZFdtBiB5ZMmMBRVupT2c
	4xgmEq437Ib9nSwxqPEZgYrgbmiP3jXz3930NzA==
X-Gm-Gg: ASbGncu86WjneDeGj21STK8r1NeBpRbiTpX6GQlkmZQsecTav5YTc2l+311ZK8DOR8x
	/D8Septe9OR+wd6PomNZ5bAS9PQroyJx7
X-Google-Smtp-Source: AGHT+IG1/7GNikn+o7qWaeU6OlA3SHIeQqG6VzX6iFXwmrBOhF0bD/LXd61skcVAWua1i/pv/Z75jusfAxofKt3ImP8=
X-Received: by 2002:a05:6902:2e0e:b0:e39:9b9f:7f87 with SMTP id
 3f1490d57ef6-e399b9f830cmr6954354276.29.1733153086437; Mon, 02 Dec 2024
 07:24:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241130094758.15553-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20241130094758.15553-1-krzysztof.kozlowski@linaro.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Dec 2024 16:24:10 +0100
Message-ID: <CAPDyKFqiar=EKBHG=PHimjNcdLKsVdx+BRZReEJzHr8_qoayeg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Drop Bhupesh Sharma from maintainers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-crypto@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Bhupesh Sharma <bhupesh.linux@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 30 Nov 2024 at 10:48, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> For more than a year all emails to Bhupesh Sharma's Linaro emails bounce
> and there were no updates to mailmap.  No reviews from Bhupesh, either,
> so change the maintainer to Bjorn and Konrad (Qualcomm SoC maintainers).
>
> Cc: Bhupesh Sharma <bhupesh.linux@gmail.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

I have queued this up via my mmc tree for next. If anyone has
objections to that and wants to funnel this via another tree, please
let me know!

Kind regards
Uffe


> ---
>  Documentation/devicetree/bindings/crypto/qcom-qce.yaml         | 3 ++-
>  Documentation/devicetree/bindings/mmc/sdhci-msm.yaml           | 3 ++-
>  Documentation/devicetree/bindings/net/qcom,ethqos.yaml         | 3 ++-
>  .../devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml        | 3 ++-
>  4 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> index c09be97434ac..62310add2e44 100644
> --- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> +++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
> @@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Qualcomm crypto engine driver
>
>  maintainers:
> -  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Konrad Dybcio <konradybcio@kernel.org>
>
>  description:
>    This document defines the binding for the QCE crypto
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> index 8b393e26e025..eed9063e9bb3 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-msm.yaml
> @@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Qualcomm SDHCI controller (sdhci-msm)
>
>  maintainers:
> -  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Konrad Dybcio <konradybcio@kernel.org>
>
>  description:
>    Secure Digital Host Controller Interface (SDHCI) present on
> diff --git a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> index 0bcd593a7bd0..f117471fb06f 100644
> --- a/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> +++ b/Documentation/devicetree/bindings/net/qcom,ethqos.yaml
> @@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Qualcomm Ethernet ETHQOS device
>
>  maintainers:
> -  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Konrad Dybcio <konradybcio@kernel.org>
>
>  description:
>    dwmmac based Qualcomm ethernet devices which support Gigabit
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
> index 758adb06c8dd..059cb87b4d6c 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm6115-pas.yaml
> @@ -7,7 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Qualcomm SM6115 Peripheral Authentication Service
>
>  maintainers:
> -  - Bhupesh Sharma <bhupesh.sharma@linaro.org>
> +  - Bjorn Andersson <andersson@kernel.org>
> +  - Konrad Dybcio <konradybcio@kernel.org>
>
>  description:
>    Qualcomm SM6115 SoC Peripheral Authentication Service loads and boots
> --
> 2.43.0
>
>
