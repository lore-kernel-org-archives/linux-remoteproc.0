Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713A258236
	for <linux-remoteproc@vger.kernel.org>; Tue, 21 May 2024 10:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716285701; cv=none; b=Qpojh945OI9egivGRKl2srONtyY76whNBQZbxA7RoOpjWcDxojjFSa3/NdRKALDBPvkrs6tZLb/bT/6cwssPZ5G+1gUYE5gp4MkIuSt2J6rGLDHMqpKxwtdQYr6SyAlaimtbUNVYErfzBFBziDlWtkLtG2F52tPSH3Or0p60MYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716285701; c=relaxed/simple;
	bh=eSvaMBIbPocMUUAl2gCaybx5KCg+piZs3ZrESkEh/t4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GD5vBOzmVA2U8XPEIY+FnhlUXP0Pb9DgHXI4xTd5qrrPdmdX97OHTG+NWOqWL4TYyC+b8W9sabx+XffpgMmbSDHYgZDI0AF4WG7sgXz3aoj/ytKYDnedmivPH5QaERMtqc/oVnGioPtpqJMRk3UJKrSys5F0vZVOUx/EdeAe/V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RBwG+Be9; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RBwG+Be9"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-deb654482bcso3582628276.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 21 May 2024 03:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716285699; x=1716890499; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=05P/WlwWKKhut6I1eqLgXZLr7T/6QQDhvGE0vkqsqJo=;
        b=RBwG+Be9ISsaQ9wSEh5/7UhbNY26zueVmxaSRIwPcub+SFxb2Kpwc9C6GoYx4pUwHS
         IGvJk/ZQ7zrlTC0VhKbpd5/Akik4LiOOAl7XUH8xMq/GpERYeonlifxAGH2E+0HCkRVU
         9/YVsFB4kGs9prmVZREu5rViJ6Xp7axxWQnY9NL3Cxm3N02cqSJ6fVuhgJNPdko/H/eq
         DKVW7NTQ6MoPe1uZKfVulGfwDTgEPaebagIu7gIeyq2igu618c7vz9m9+8XVRuPLbTfu
         8MC8bdyQVQpWRFF+i1CaWLn/DDcDT4e3ZSU+10gkCLSLM8i2syOq7uz+NGuBYmaUyctx
         eTcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716285699; x=1716890499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05P/WlwWKKhut6I1eqLgXZLr7T/6QQDhvGE0vkqsqJo=;
        b=MibRUNPtGkmRc/ExK0nmWU3KvUWjz6vxG9bLIs70IA0D1xJkBLgWt1TBZ4PbDCo+1g
         eHY/ChWhwlkJuGVAftQ77/apE29TS2v24wQmXiYMeyZIyacybHvuF3knrVf8xdro+jAh
         eC6kPCqagWxyU4cdueISRcX1RI9bm/7J6eXVWXmJYJbTuDw2hyx+p6z+rhbZapXPVkCU
         mDr2ktTp0fyllg69h2XrfQOV2zkZ8MrqJWoL3DmJsYRBBK3UBvZ+FOcbIqyyYsDjU1Tk
         ac2h7k5Q8tzh6C/uFf4fdOEliyLopcUTTMmtS50JHIEcx0nMvlpkZGpK1L1tQh8Je38L
         5Vew==
X-Forwarded-Encrypted: i=1; AJvYcCUavz991XaVMydF5rxcxzNyh5lbhmCKBFo1wOP/uFouOWMq10YXl7xv7BjMGJ86Ad6tHkiEGfnT8aE4mC18ON51yTNMDmHdW9ezOtNxNIE26w==
X-Gm-Message-State: AOJu0YysgVfbVoqkJkU0NNj3A/+zKlXmtBXbNaSdV12QIjL16TG81bB9
	giwfZynHaIVW+VrQBvCper8Ibg8P5v5aq1AGKpHArFh8KOjSm+RdMWD40eevLIN71/QYGG8dT5U
	88fo89UW1utY18b5IsyaZcD2TihvBsrDa34BvxeUhIi1l+3I8mLA=
X-Google-Smtp-Source: AGHT+IHBg8oA+nkRXQ2kYvjQcVJRCg+dFqmIUTocHTkS2BlcGovr4ox8u9dBOyyUejfPP8YcSa3ykxFw12tBsBCGjcA=
X-Received: by 2002:a17:90b:4d8d:b0:2bd:69ce:1966 with SMTP id
 98e67ed59e1d1-2bd69ce2345mr5713134a91.29.1716285678586; Tue, 21 May 2024
 03:01:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240521-qcom-firmware-name-v1-0-99a6d32b1e5e@linaro.org>
 <20240521-qcom-firmware-name-v1-6-99a6d32b1e5e@linaro.org> <a314906d-b297-474d-910c-6634c8c23042@linaro.org>
In-Reply-To: <a314906d-b297-474d-910c-6634c8c23042@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 May 2024 13:01:05 +0300
Message-ID: <CAA8EJppLtsQmjC93_zPSqeWAk9vM_ZVF96pcWLRHHpm4KrY2cg@mail.gmail.com>
Subject: Re: [PATCH 06/12] remoteproc: qcom_q6v5_pas: switch to mbn files by default
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Kalle Valo <kvalo@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, wcn36xx@lists.infradead.org, 
	linux-wireless@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 May 2024 at 12:49, <neil.armstrong@linaro.org> wrote:
>
> On 21/05/2024 11:45, Dmitry Baryshkov wrote:
> > We have been pushing userspace to use mbn files by default for ages.
> > As a preparation for making the firmware-name optional, make the driver
> > use .mbn instead of .mdt files by default.
>
> I think we should have a mechanism to fallback to .mdt since downstream
> uses split mdt on the devices filesystem.
>
> Perhaps only specify .firmware_name = "adsp" and add a list of allowed extension
> it will try in a loop ?

Such loops can cause unnecessary delays if the
CONFIG_FW_LOADER_USER_HELPER is enabled.
Since it is not possible to use vendor's firmware partition as is (you
have to either bind-mount a subdir or use a plenty of symlinks) one
might as well symlink .mbn to .mdt file.
Another option is to explicitly specify something like `firmware-name
= "./adsp.mdt";'

But yes, this whole series is a balance of pros and cons, as it was
discussed last week.

-- 
With best wishes
Dmitry
