Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C3647A6B
	for <linux-remoteproc@vger.kernel.org>; Sat, 20 Apr 2024 23:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713656535; cv=none; b=e9CefpVyYqkwy85MJkRRtlglmLgAtADHEr8B0nSp8HUROx6RQJ206VIEf/VCJBmj1nJLYgflrz+P0oVJ11b6D8hmVd/gYtFDFQR4sb2vNjCrKgztWBg4csx7sayjVJTUIcFe95NLiPsX7LrKGcKR8bZ+f8PjXOLuQBj3xmCUpVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713656535; c=relaxed/simple;
	bh=P7wCgcvk3CXQlUmwNiz9YK/s/qWvghlkgj7Npb/P58U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CAXwTHjGEJB69lVYEL7BjXG+1ijSy10R+m5AY7ulpenF0H8Ns63tep3RoQlABSvVOzv9jTVT1rqGOJ8W1zbuoa0xG6W+ECpi9l+iMdh/VkbInKZ2uJNrnEsquYzHGi+TVVMCvGVYIxLtlRqhS6yGpgjKCUmA/oWqHVhWPK0XVC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=feRfuyL7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="feRfuyL7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3481bb34e7dso1791141f8f.3
        for <linux-remoteproc@vger.kernel.org>; Sat, 20 Apr 2024 16:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1713656532; x=1714261332; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o4/aAKj7Bape/9U3r/rKTjbwo82BuU6ZKB4zw7USlWg=;
        b=feRfuyL7Vf9MJyQlxywAxSy3lR4KHYBe8VhK+oMYyJtAAG4jBRF6lX488IdQw38QED
         YuvFXpbA6lbVeN3QzW5QltToijcXKh0YmQbePWK5qkMeaHRrRdWQtCZA2sMSQikIkc3U
         THNjVG3OsAqlitfS8lrb3K4vneHSgtLSGltAUwz68Wi0xxmwWUUfGtqwVPTYqDfLXqNf
         LRnWp3dSwpekSu4ZZUi7QvapP+Xr0twA/rtMhZaqV2PnjbNSWZbKb9hAcDhVolrfcp4I
         RLLStTjXIac31kel53xqksZLF/ED2PyvwEGy34FL8Qa+RLMM9d5AZmYtv058Nlh2BVr5
         uMMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713656532; x=1714261332;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o4/aAKj7Bape/9U3r/rKTjbwo82BuU6ZKB4zw7USlWg=;
        b=KbuWpSfn0v9QQ4ooMXAS7XmErRjEE+dxgeDSvaKPGMfPYYSZCzNT5YjBSIicO/iNQ6
         jiuobX7o2C50EdMpII+iFBLAvHPiYpv8ITE7qbbxoll470+t0slN/N/yWTTfQfAnZT8b
         iLkjUck/4qyYUflYHigFfPpdLVDXK0+SWkc/sH9Ituvpk5uKM2n3Ad6NRm+rkELM7rE9
         6jAm0xZjJ6o1s8eoVUolU41ncJ092ozQaiF5tz+t0VUYiLVk1knp9bpE2+Bgas2o1tLS
         EP0LkMt8d54rtR1QY34RzAA73y07q6xWyrRpEeQPXJT1vEIGvkqatWJPvIrvzuj/Ump6
         k+Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUU+mA9lZ7Ch0pJzHizoyX7hO6oGHVm8nz5Ra99mqFRxT6d8XIZXGYbbu1wNwk9gYlK+MtrDNRhzayBVyJoqnbuu500c2lYCOu06J1gUcsfcA==
X-Gm-Message-State: AOJu0Yx6VdGqCkybMNVW8UtbQP6u81XdJ8dJNAPGy6TpQOeM1zxSzPHi
	Yuula49RkgntbK9D7Wlv9TcPwjd9m+3xyiWhSCbL9SXU1RK9Lxm0+AzsSFwYdJA=
X-Google-Smtp-Source: AGHT+IF/vrFe1Yheut9IRQjD08Xl2XKY8vMsIQS2EtJJcZySN1PW/SSIyF+ZMkaAe24Sf62cHcUjhw==
X-Received: by 2002:a5d:66c2:0:b0:347:2b42:a398 with SMTP id k2-20020a5d66c2000000b003472b42a398mr4031447wrw.2.1713656531594;
        Sat, 20 Apr 2024 16:42:11 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id p3-20020a5d6383000000b00341b451a31asm7904177wru.36.2024.04.20.16.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 20 Apr 2024 16:42:10 -0700 (PDT)
Message-ID: <84a70058-38f2-4e76-b62e-b6c44e880f7b@nexus-software.ie>
Date: Sun, 21 Apr 2024 00:42:09 +0100
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] soc: qcom: pdr: extract PDR message marshalling
 data
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>
References: <20240419-qcom-pd-mapper-v5-0-e35b6f847e99@linaro.org>
 <20240419-qcom-pd-mapper-v5-3-e35b6f847e99@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20240419-qcom-pd-mapper-v5-3-e35b6f847e99@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/04/2024 15:00, Dmitry Baryshkov wrote:
> The in-kernel PD mapper is going to use same message structures as the
> QCOM_PDR_HELPERS module. Extract message marshalling data to separate
> module that can be used by both PDR helpers and by PD mapper.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> @@ -0,0 +1,315 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2020 The Linux Foundation. All rights reserved.
> + */

Is this the right org attributed ? Definitely not the right year/years.

Please fix, then.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
