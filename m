Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C92816EBE8
	for <linux-remoteproc@vger.kernel.org>; Tue, 15 Oct 2024 17:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729014348; cv=none; b=c5D4llnmN4jW9c+k8XT18pwrcDdJzhZuEjAoFmdgwVS4SdoXKB48JL+3fGisxxZrOTfKDQyemxCL+YjgB13oI+Mkd8yxCJ9aFmrYPSTgAWd9q6DSc4aUEkThIjLsN0utMAzCbOS2X0tLOXmOtSt9iGJHZyA4cTvYY5aibfu0BK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729014348; c=relaxed/simple;
	bh=BRwYGtJfD2ZMxkQGQfTMrxkT3kcPBYxzJBdsN1CZfRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2SjS/coM8WyqD2pZXTpVaXfhRmxDDjIjIXRnWbtKR1ycAeb0FH3eW1WC7zowPF8XH7n2mnOxJcGvmrDfYx2lMF2E2sZ7VDvXRWL9k0SLseHaRY6416zsKQawiV8v+eM/3HvnYsfMMpnl5HSPaJdZDgPlI6KevCZc3o4GFhzjc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xxNZH6Rd; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xxNZH6Rd"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-207115e3056so46722515ad.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 15 Oct 2024 10:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729014345; x=1729619145; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2pnrAdC2C0BE3RK2dDE2ExUA2qwhyaMBrQ9ZLRFBKLc=;
        b=xxNZH6Rd/c5o6Kd9B9tqg9LxdR6xkRXaxGZVzTAMb3Obucl8uNdAYZDiQPLmoakvsL
         oWhZUEi+niznkx2XjFBVHCe8xbe6yopkkRKS4ocA33EFigxHm4YhzrIP02pr3otqOX33
         2DoyFccU9m2tklaP804u8n5m7H8z5iAxHIK52n6q1AiXM6korLxfGzYX7ddnygmR5SAq
         fEK8rZBhebBkgwabn9wlezv7sH6dRPBmJgMQ+QkF15WKTnGAt03U3OPVO7Hl5rq4EEQ8
         EOZsyTxwQI52rvc63pfvRq2M9gqgCYQ/825bGF2TzqNaNlDwq49kO+rZiWb3x5QG8MYW
         7T0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729014345; x=1729619145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pnrAdC2C0BE3RK2dDE2ExUA2qwhyaMBrQ9ZLRFBKLc=;
        b=KQR8Sa8QwyPUuqtZFdxtE+Mtqapt8rr9i3VPgke6kccoBCi2b54IsZ9uPyQvFEbS8i
         aMNwlyb5qvd4O6838u/6wt14sxz7VY6n7G03DNl/MMgP0570V/9BqJx/TRQ7ayNz5Yni
         sq5xE/ydHxkETu9Z9nmD/JNfNHlvDpyqj6qrVHzbzi/V/Kli4z67bKx8iDl5sIJKrv+n
         OJR38EuRpboonVbJRJwLfwsN2uH1gzpSBYsQ2WdF4Df+0f9zyNX/jiseiNeXKdJzEjnZ
         KwVBI8oxzxmODUuyMG7wRi9tqttL8pG+VptdM3ooGwtrCJAbo3LWtnIRcwbWtd9+2/cd
         3inA==
X-Forwarded-Encrypted: i=1; AJvYcCVnXlzuhfI/I9cMkgpT/KJKCnSakPaaum+l6AF0FjguqVBKzGc6JKbE0VlAD2EoIljzdGmmiOSsDoxIzKhdMXKh@vger.kernel.org
X-Gm-Message-State: AOJu0Yxh0Raj/XBoFAKMMqX8j0TRig0Uop9GTK48ke0GXt0MtEzgFHOM
	zKcTrikZUibWLz5ybB5U0t8ljwOdgRirJwU1j7s7sFsZGnIvc1shfHqo4/YDUJOdN3gxw5s9WT9
	4
X-Google-Smtp-Source: AGHT+IFhFlnB95Ly37ttoU7wxg7jYWU0jGICSaOt6TVzXP7QvyFQFyJ0aAZUuFEN2D5AjSEVAGmsgg==
X-Received: by 2002:a17:902:f60c:b0:20c:b0c7:7f0d with SMTP id d9443c01a7336-20d27ecadd6mr11986115ad.25.1729014344626;
        Tue, 15 Oct 2024 10:45:44 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3f26:e29e:2634:fca0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d180367bcsm14592775ad.145.2024.10.15.10.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 10:45:44 -0700 (PDT)
Date: Tue, 15 Oct 2024 11:45:41 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 00/10] remoteproc: few dev_err_probe() and other
 cleanups/improvements
Message-ID: <Zw6qRdLSkp1PT0lD@p14s>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>

On Fri, Oct 11, 2024 at 03:09:08PM +0200, Krzysztof Kozlowski wrote:
> Simplify drivers in few places around probe function.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (10):
>       remoteproc: da8xx: Handle deferred probe
>       remoteproc: da8xx: Simplify with dev_err_probe()
>       remoteproc: ti_k3_r5: Simplify with dev_err_probe()
>       remoteproc: ti_k3_r5: Simplify with scoped for each OF child loop

I have applied patches 1 to 4.  I will let Bjorn do the QC ones.

Thanks,
Mathieu

>       remoteproc: qcom_q6v5_adsp: Simplify with dev_err_probe()
>       remoteproc: qcom_q6v5_mss: Simplify with dev_err_probe()
>       remoteproc: qcom_q6v5_mss: Drop redundant error printks in probe
>       remoteproc: qcom_q6v5_pas: Simplify with dev_err_probe()
>       remoteproc: qcom_q6v5_wcss: Simplify with dev_err_probe()
>       remoteproc: qcom_wcnss_iris: Simplify with dev_err_probe()
> 
>  drivers/remoteproc/da8xx_remoteproc.c    | 29 +++-------
>  drivers/remoteproc/qcom_q6v5_adsp.c      | 17 +++---
>  drivers/remoteproc/qcom_q6v5_mss.c       | 48 +++++------------
>  drivers/remoteproc/qcom_q6v5_pas.c       | 22 +++-----
>  drivers/remoteproc/qcom_q6v5_wcss.c      | 92 +++++++++++---------------------
>  drivers/remoteproc/qcom_wcnss_iris.c     |  5 +-
>  drivers/remoteproc/ti_k3_r5_remoteproc.c | 74 +++++++++----------------
>  7 files changed, 92 insertions(+), 195 deletions(-)
> ---
> base-commit: 0cca97bf23640ff68a6e8a74e9b6659fdc27f48c
> change-id: 20241011-remote-proc-dev-err-probe-c986de9e93de
> 
> Best regards,
> -- 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
