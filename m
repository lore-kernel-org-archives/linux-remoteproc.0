Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4069219D06A
	for <linux-remoteproc@vger.kernel.org>; Wed,  8 Jan 2025 10:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736333657; cv=none; b=ANQihBYa8ShwyysRQFEh3k7JOWtAddIRQbD4vnpg5+doJZeoS4S/o2mSxUYhE5k03tbqHHRz44M/VZDNbvgs/W5hdydoKonI+tKa1lcUAg63xAwS3tosk2iIRHkQZEkpACIqELNJelyvbW5kwjmTU14wn4PxD8N32vlI4/bxz2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736333657; c=relaxed/simple;
	bh=xfPbO4siHbepFuqT00coFy2gx+RHsJcexQO02LcOy0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RnSy/duM2xCFm9SNMYhg5XTXLvzHd64KF8Fl47fw1S+VMgQkuC4rtaaDO01ms/gYZWVqQiwDFubRTBA5c4duHvznbcFca8iSADyPwtONCtD1FvQmMnIGA+ko/A8kwhfv5JVBGXHVn8hvCsUi2X9UW65SIaICAK63PfZObJmhWfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rMBh2FSw; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rMBh2FSw"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e545c1e8a15so11020461276.1
        for <linux-remoteproc@vger.kernel.org>; Wed, 08 Jan 2025 02:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736333655; x=1736938455; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bLNt/fipL8txqhoiZlT5cpcY9NIeIicmN6z7rLLh9ww=;
        b=rMBh2FSwoFqCPnKV6K0hdeVk8x5W95WML1ArvakgueDpNa6eEhfJlaJSwIopOQX5vh
         zSLtQkmBC7/BS+PkOD0CiD5c6LrAnJlmQwimp5BsxtJG89vWxSE9mG8fcSgnmjDwKzTj
         rFdEcfYH6f4ueWbQU3F18SyIHq6oiAc24+eZpG1ZxBRqilRjOUjqBBOhzsA1XJK5YHBz
         4I2vn+18Z6HGCP/mZx+6ApoiYOsf4JC91wfNjxpzPj8S6SBTPlLcryX+zBvVoEqyai23
         oEdrobiXjFxHb9dZoaEEQuUlC2nS6VJDUZu2jucC+52NJPDxPaLzXkNnXAWqqCLBPjWQ
         FJwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736333655; x=1736938455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bLNt/fipL8txqhoiZlT5cpcY9NIeIicmN6z7rLLh9ww=;
        b=iEWtJxxojwwmTvr+GcnvmOmkuMiIXGtZ95QGFrBRzEQkkcH/T5hcO79Eh1UzWiGhHl
         l1qUCWIbQF/SEcvST7txWwsCc6yDluf1U6zWPi3tjHuxySPYrFiLpK4xMF/FPhIkCLCm
         f+37BNROOjC82plXLldA6g0K08eqr7NXZFrCVY0t5V6NhAhwu7cEHAHn5pOtdAHyQiLl
         aO5croU8dobluHxR+BB0bjzorCCV9jEXYCSWvxplLaTZVVOzcdrF18s6+hUzCsoFYj5y
         IlFcpiAdjgUKdJXp9KxZo3RzlFhoC8q2xnHtfB4uCWBMzi0gKTsVGeVAxJ6S30VpxtQC
         YP+w==
X-Forwarded-Encrypted: i=1; AJvYcCWGPBm4XKjjuA+EsTF7hWA4exObyYtbcR+10EVJ1qS4BxE/ctW6lSSaYVj8/4vulOW1ERiFBsuuGiTFr93Lb4d1@vger.kernel.org
X-Gm-Message-State: AOJu0YzPY0P69paVuwmywhY1gnDjSu3pYwtMV6OS79a735Q882un+nK4
	lt2de3mV0XA/YtOlfWB1DZREM6dRP5dGlNOG15pe7vmZcKEnTjGjusgFp+ekCwXCAFKLKZ0N8xm
	K968/DUonNBMralfDL9qw1m6zChhQUKzfBBD2uQ==
X-Gm-Gg: ASbGncumjIG481MqQAhatXttfb9JZJG8BnMoHXk7Jej9UineqHpaPaQ0lGoNBL33vs1
	dfG4/6yJtWvzprk1ukLH8RhQej6KrPCLau1gH7n2SMZ51yHdPPRJU9LiqI/gSCWXGQISTZQ==
X-Google-Smtp-Source: AGHT+IFLLOC7LQVGKj7Xv8yhMwD+/uQH+vteYYlRekt55USR33yr0LXCfhenra8iPQKn5Nehn+wsSVxFmy74JrlwB4U=
X-Received: by 2002:a05:690c:3612:b0:6ef:8451:dd99 with SMTP id
 00721157ae682-6f53124b4dcmr19388017b3.24.1736333655229; Wed, 08 Jan 2025
 02:54:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250107101647.2087358-1-quic_gokulsri@quicinc.com>
 <20250107101647.2087358-3-quic_gokulsri@quicinc.com> <pjm5wrxnfutixopeeqzgb6q75z6cilpgfcd2maigqlu4i34mta@2k6trubvrkp2>
 <3e64b792-bfca-4b07-a13e-6deb966f3d4f@quicinc.com>
In-Reply-To: <3e64b792-bfca-4b07-a13e-6deb966f3d4f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 8 Jan 2025 12:54:04 +0200
X-Gm-Features: AbW1kva4gmKTCpDvcHQN2ENBM5bwKXSzh8i4nE2so3UExC72BAqV63-em6-eMpc
Message-ID: <CAA8EJprxYeNGvr7zed8eRcxDFczxM_TMdJ51GK+cHshhj4C1-g@mail.gmail.com>
Subject: Re: [PATCH V3 2/8] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
To: Gokul Sriram P <quic_gokulsri@quicinc.com>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	konradybcio@kernel.org, quic_mmanikan@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	quic_viswanat@quicinc.com, quic_srichara@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Jan 2025 at 14:52, Gokul Sriram P <quic_gokulsri@quicinc.com> wrote:
>
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/qcom,ipq5332-gcc.h>
> +    remoteproc@d100000 {
> +      compatible = "qcom,ipq5332-wcss-sec-pil";
> +      reg = <0xd100000 0x4040>;
> +      firmware-name = "ath12k/IPQ5332/hw1.0/q6_fw0.mdt";
>
> Nit: .mbn
>
> Hi Dmitry,

Please fix your email client to never ever send HTML emails if you are
participating in discussions on the public mailing lists. For example,
quotation level is incorrect.

> Its .mdt format only in our case.

NAK, please work with Kalle to pil-squash the remoteproc firmware.

-- 
With best wishes
Dmitry
