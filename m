Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BDF30D418
	for <linux-remoteproc@vger.kernel.org>; Fri,  3 Jul 2026 18:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783102194; cv=none; b=TM7QgetIkKCkz86ovN1mPI93DUpQk2evDvsF+kcxCPdwS35mKHH8RQWTltn5yjh0lFsYA0vlF3iB+BE3gljZ4kwql57Sc0BZ2hhWcpa0lJPmoTNl6VPQGl4E4W03asyIHxQBb+Njsw/zvER68DkjmATC90X8JexmPRQBJD3iYMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783102194; c=relaxed/simple;
	bh=tgraSq/9gwcx1TlvQJClsEB9nYR8gJqZ8hIiRgK1PwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t2VzATi1MqFsQ34QLXhRWg5iRBSuV4ufqRsUQ2ji8zjy5TF9YqwjqulVrCQ2NlpmDUpVaRjVx3o2PeNWFxYkF1N3erALe7xhjCkrp5+WHOm1s/h7Jd1E3K0lzeYmmHCFOoFCYh7nxLrF3GMlvrY6j0wvqcPh5Wq0zpP4hz/Lff8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ra4xy5wv; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ra4xy5wv"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-493c733f15aso7877465e9.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Jul 2026 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783102190; x=1783706990; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=v0DdjgoNvkE0UKI8hOQQ2MWCAbcQBGlfDeboRpCm0gA=;
        b=ra4xy5wvOi/TPR2Z34MK32O/ruNxzV+1v6h5iMDy1P1Fn3UGUdPZM2687Pony5MH/s
         WLLI7YRHTn4SPDcZsIu7rwolyAPhKocKplLXYQIeCbqypXDo9Bgn9zyBZg+AYgdPS3c1
         aC0uv6QHm9h7b6sKySLAA0Ho1VbwhCEAwnI9dTQ4gsjtlUt+MTijdQasxwuPvJmyQaOV
         k9IObRwH0OUTZ17q3WKTOsLRgxAQMxGvzdvs/u9wU4so5i/GhP1eYPxkJggBq5exxNCC
         umrd9HSyTHQypGHWdLak08XO0Qr3hi3XOCH5195z4JS1UN6UInIl2mW0V978DqbgDTOT
         D3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783102190; x=1783706990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0DdjgoNvkE0UKI8hOQQ2MWCAbcQBGlfDeboRpCm0gA=;
        b=pXql/GhJ+hBRkNJ+oIxM4C7iDtIPOY1bAN6h2E82L1sBqIJdyQwJWBdce31UHmjV3G
         HduaVc/ptQDB23+/cAmtkaQK2bMaDeEOtgcnFf+hV7M1ut0nw+Gf3cHtZHoie/uRUT/T
         hMgz8BrqJ4nHqon66yxdYEN0XEDHgcJSt3+Kziav9RpAvsaByGzAbYIxI+VlRLRvmys2
         4VKChRYnCU55iOG2Vy8ImdGCV559ZqulTUf5nfLXAR/a+zeQFM+quIJS1eEIhh3qsk4p
         X6dVMpfwW/emtiWRwRhE5lulsys5iN4A3XZgd7SljlQyCOIBvBQKMZ+kR/hNogbGdEi5
         Rr3w==
X-Forwarded-Encrypted: i=1; AFNElJ/0nN72O/+hJY5y/oFHEP2+bqZi4nx4M3J7WbaEqKsOf+vscjz/wyg2iPtzXFmLxMd9OcZ7EIcL3bqfdPO28Bjp@vger.kernel.org
X-Gm-Message-State: AOJu0YyfDDdqy2u8TE9JSHCFnUzWjWz+xuV69cZRdGn7FAkXvyiORAbU
	TtOgYTCvEno/7vJJ+nZins4DKCrZN2ULbG2KzFK7AlFRmHzT+Rdx5t1M
X-Gm-Gg: AfdE7clMobwFOYl8yvovzjh6FG06VR2UVe4hPX8s9vaJoCEvd4lsS4iILcB7Ou4jWVK
	04d4vkpDIABcgWgAH3An67zT81RKD0ogxcQJuoyt7cAwNl+i7CyCKzHoSqYxbvN/PpWx6We8lM5
	SnutOptZQCSL4JD3j7KkISYaad2hJfwvMe/ex244EKRCnsi3JmqoQ93tZvIl7VBRlmgX3MlrFAo
	FY8fEpOIz9qQCWg6s/tdoJpqu1xMJEFDasoHCLEjwOTVU0jU0MsXUunCpXRyNYnP8f9eQyCMUMM
	xGInvsdsuGIP0MyFAxrTehjl25cWgH7ocvGUL7etBSxuCwfGWZjwYi56dsJaWYRdyIM6Cw/5OWt
	DMFZUaKHH47PT+jfJqMsUISkaH7P0esgOEQVZ8whgY4IQQQdoyjB8PcqzkPa3jyBq/QxISBhruA
	xvW+Ulzqe/3sq853sX1A36/g2eEIGtarFLztDU9mOkqx0sZz3vbKZQYX57wQleI3jHhjWivPMGm
	IzNkShY
X-Received: by 2002:a05:600c:314f:b0:493:b2c1:b2f9 with SMTP id 5b1f17b1804b1-493d11cf274mr4122605e9.8.1783102190297;
        Fri, 03 Jul 2026 11:09:50 -0700 (PDT)
Received: from [10.128.11.240] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm1044214f8f.33.2026.07.03.11.09.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 11:09:49 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <8a418031-4bfc-4212-a7e7-0d88aa4621c7@gmail.com>
Date: Fri, 3 Jul 2026 19:09:48 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] soc: qcom: Add QMI TMD support for remote
 thermal mitigation
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
 Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
 Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 Casey Connolly <casey.connolly@linaro.org>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
 <20260703-qmi-tmd-v4-3-3882189c1f83@oss.qualcomm.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260703-qmi-tmd-v4-3-3882189c1f83@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi all,

On 7/3/26 06:03, Gaurav Kohli wrote:
> +config QCOM_QMI_TMD
> +	bool "Qualcomm remote subsystem TMD" if COMPILE_TEST
> +	depends on ARCH_QCOM
> +	select QCOM_QMI_HELPERS
> +	help
> +	  This enables Qualcomm Messaging Interface (QMI) based Thermal Mitigation
> +	  Device (TMD) support for Qualcomm remote subsystems. It manages
> +	  TMD messaging and handles QMI communication with remote processors
> +	  to exchange mitigation state and apply thermal mitigation requests.
> +

QCOM_QMI_TMD can trigger an unmet dependency and build failure due to
selecting QCOM_QMI_HELPERS, without ensuring NET is enabled:

WARNING: unmet direct dependencies detected for QCOM_QMI_HELPERS
  Depends on [n]: NET [=n]
  Selected by [y]:
  - QCOM_QMI_TMD [=y] && ARCH_QCOM [=y]

- Julian Braha
