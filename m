Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E03338E5F2
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Mar 2026 22:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773095053; cv=none; b=pJm1Xetc05wmT3sPAsgDbPeabJ3K3OlV/Qyz3H1+NUKy42Vk2vE90ValLk+pJtnkyx72SQ2CECSy/aUMZstMX6vFfMSkRmYq0ykQLoFW2WlovBjRltnKSemW53LYlPRGAAOTQsTFlSY73CpAiAx4cmrj4rhxzxQQN15a2CaeoLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773095053; c=relaxed/simple;
	bh=p74FA63573R7vSgP0Ymlo382GmnT2c2KE5hGfqtfC/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F25VdKz9/dHhy1DG/C79gB7RwcUc74+f+3e+dnSQeatkYagOjYcfF+g0nD7hKpA/DCrzEnJeBghpWQUOJ2zW/BHZqNBt+2yK+PAYZSMZpET/0iySw3X42BAKVOrTdHT+bnjlIFyvprxVTjpkCGM6ECGoYgflL9q530unLIjFS/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FWQ/dZZp; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FWQ/dZZp"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-4170e916d77so636439fac.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 15:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773095051; x=1773699851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SHnLn6sNqEV/ng1JAOx90FzzxM70L3M7Mka9F9TdMQ4=;
        b=FWQ/dZZpZ8MAhDSERJVLDYZr9GXgNv9ZhTnkIjdqAo2D2KqEojLnCVyWLzJahB2YJ1
         rOe6eckQkDVxozsaN3gSKctLYrFOiodHeblIKTTB8nGpEMWfXUmh4wIYtQGo38PulTIt
         3nfWppAgg4UX5On29+w3COYySDlEdLfo2SbUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773095051; x=1773699851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SHnLn6sNqEV/ng1JAOx90FzzxM70L3M7Mka9F9TdMQ4=;
        b=oeX8V543oAy8s381l/ZJnYwAW8knsS1zF3/Bn6ksVm9ujRUSzEIQse1zTVm693hgK5
         Db5idb0340n31/E15S1we+0cvnfvagC/Z9N5FhRp3Ip59vRTby/1JbOVRVcR4XBx/LWV
         jpXxvHbtYpQkk4/U9/AZgvC3eqJA3dYIY2yhuNXwZDOfe1A8WGmphrCOI7E7oVOv/kIx
         ymJhg5+Jt91W5M/cIZwl3neFOJTTHI37l1B0At6PTpOMaW2HOtRWyn3YcHuJPXz6lqQS
         aK67ibInFpD00RQL2lSIahWAFB8aqD8SDgLB99fxoU3NF3+nPftcS4fa6p6GtcxNquLL
         mK/w==
X-Forwarded-Encrypted: i=1; AJvYcCUprWRE91uaHEPAqJ2zHoQu3VSxRo70CVPGD4FQeaUGCNvLWgNsfj4pXhotV1vSega2Vyg4Wb9gV3TgA4l9JrfG@vger.kernel.org
X-Gm-Message-State: AOJu0YxAgn4yS/4pgcsonRD2Ur0FRIUOkX3lbj0hgZFcA2pwf3fOBJwR
	YSs52nHV5lF3ozReVifjM3jGJ0Uvl4H1+Noy0lIwqjBBPFzlQagwvyGoIg1GEMUyYXM=
X-Gm-Gg: ATEYQzyCwsFyavRavUT/k2Zw2snWjIUIO3qD90k59lBHuUKuKMl0Oc5lTjZWK1bwdYL
	P74+zwkxY6eYJYYJBqGDFZRnjFIf6nZKiYKGE/NE2u2fJ9cJ0QRRgpvQFIXwHqya8dq9UEnoFtV
	h8KkK0O1Y//0IJPlx6J9LoqFIWAZl/lQ288LzU4cMZPdre2oaLMtGW32lPqJKz/Bw/dXbXLkCLd
	EijR0xEsP95PzCrINXyO3X4oYlTpaprxUNgNpfMuNEPUOLDxppfgeDKC7YczTztOEEtKiSfb5a/
	xMe6SI+ZPsmMKdHWgiUZ3Kqw1peMhMEBSvVDLMK4SQzyWkzV0xvPkr0gWoJdcMzwxD2QPh+a6A/
	D4YWeiYK6p0cItbMMDcCDS2HdKvfM1zurI3pQNjh9xsRCqv/eEyvQuc6Gmbc0M7w+zFOLGy/uhW
	lPYEAJWhtmiftBBBS+PJu1X5zlQsJVsUZtwpw=
X-Received: by 2002:a05:6820:151f:b0:677:d91c:2e26 with SMTP id 006d021491bc7-67b9bd3a2camr8004764eaf.51.1773095051333;
        Mon, 09 Mar 2026 15:24:11 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-67ba42709e9sm5372733eaf.0.2026.03.09.15.24.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 15:24:10 -0700 (PDT)
Message-ID: <03136b99-1bcc-44a9-bfc8-bb4ee96c5414@linuxfoundation.org>
Date: Mon, 9 Mar 2026 16:24:08 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/5] docs: driver-api: gpio: rpmsg gpio driver over
 rpmsg bus
To: Shenwei Wang <shenwei.wang@nxp.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com
Cc: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260309205532.1794202-1-shenwei.wang@nxp.com>
 <20260309205532.1794202-2-shenwei.wang@nxp.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260309205532.1794202-2-shenwei.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/9/26 14:55, Shenwei Wang wrote:
> Describes the gpio rpmsg transport protocol over the rpmsg bus between
> the remote system and Linux.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>   Documentation/driver-api/gpio/gpio-rpmsg.rst | 266 +++++++++++++++++++
>   Documentation/driver-api/gpio/index.rst      |   1 +
>   2 files changed, 267 insertions(+)
>   create mode 100644 Documentation/driver-api/gpio/gpio-rpmsg.rst
> 
> diff --git a/Documentation/driver-api/gpio/gpio-rpmsg.rst b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> new file mode 100644
> index 000000000000..0f0a3ce3806b
> --- /dev/null
> +++ b/Documentation/driver-api/gpio/gpio-rpmsg.rst
> @@ -0,0 +1,266 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +GPIO RPMSG Protocol

Let's expand RPMSG for the first time. Looks there is another
RPMSG acronym that is completely different.

The rest looks good to me.

thanks,
-- Shuah
