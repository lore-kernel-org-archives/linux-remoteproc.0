Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B91149C64
	for <linux-remoteproc@vger.kernel.org>; Fri, 13 Jun 2025 17:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749835094; cv=none; b=Z99y8H68NdZ5C6U8QW/4IMOu8J6qjsDaT1qOyECdpeLa8IEzCrS+sb1cg7sFqIo/ctqaBV9D6yRTKY0RRChxQKS1UkoTa1iIQYMaOSF6B0CEuzZVQ6dAdzgqtSCEC1+3czWp+AuPKoH4CKbHz6qvRiEZaNVniAomRl7SuUlmj/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749835094; c=relaxed/simple;
	bh=qOAaSK0i4JY+2lxY4sFKnHMudgOX455/UPjJpdmjGWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Oj8l6rF+pXjo/HqG8jrjC2oKwiYKIO9M9eVFaUQp/fr7hFBPkaG+Bd9Ht7SHU/HLtvNgKwPmT4TX7Zc6s0/lCwRVGwLei5s9AZYRjdWBUO4WnsJ0DHFLQWkGwHQnDp8a638V/NnwkgkArPstAqnONUqa/JmqjAX7XuczjfOwJsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Kqcp4lZK; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Kqcp4lZK"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b2c40a7ca6eso2415659a12.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 Jun 2025 10:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749835091; x=1750439891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lsmpqmL7w+/CwGWjuLFXFQAJZbzAXyTWyTM4rCVagQk=;
        b=Kqcp4lZKZJrFzMPGJ5JHm4t0CPwqeBokHlwvVWGbIvE+aebaOJ+aE0KZa2TXznaiAN
         PFtPAt4wimEN/I80VGEh3GDplvqV6YuUGo/y2CWahUpFqot/7hJCCOM9fuIXVNJAxnsp
         eNb9/uoL5KjEILnZFpToUlkOaX9OZnW0xCOXMeVIRvvoBU0tNhI5WEQNWGpvQady3JQ6
         o111PgQqB0bI3Fzf6PwR5Bs7GXF6d0yIYPKzQH07CFnEygrUGpyzFMc1N7VmHEOJDudC
         PA//iuY9OXaB33/+0o5k+vZ1YiqBHMeXnTfctzKIJ2zcOFM5cU1EdVoEFtZA77gUJCLn
         PBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749835091; x=1750439891;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsmpqmL7w+/CwGWjuLFXFQAJZbzAXyTWyTM4rCVagQk=;
        b=m6KUtunOAYbwcFFVotX4mD1Pe4GLKiBZsrmBm6LquF7S28DUPi/MWkDG9u4OnBQ31u
         srDE2el9kkWWVHjtI1smgLW0EkFsygdvxBKQSG668dgEwVd6l74jCqlXFkPw8RwtULo4
         KZiUA2YfnFLGfG3OI0UW7VGS7p5A9KnOo5OwM958M0mqHwtBfuIf8QmI0FKFPdO/FpP8
         NxB52DmM05VcBqgUnaTxnUv76nr4VC4VIpkXVQzKBHO37M2S/iQwL5keMan4gOL3TYC7
         EitgkfPP7DjCg3WjnXZXQ2EcnFHKquKoC7X9C87Cr6uULq+6YwPD/VUBZE3WT0exK8RO
         Dzdw==
X-Forwarded-Encrypted: i=1; AJvYcCVVLOSpt40npfAjNsuNo70sqed3+IIKlrMgP7Z5E9JJYAqToRn0dwx/yQ+q1Ld8uBp3Zvyg+dgZw3DppmCW3fvj@vger.kernel.org
X-Gm-Message-State: AOJu0YwouCwd/LPhnnTCpPeZ9vYGxVZkCrxOp5GyZNmOQ7rCsAEnVkIF
	fYji79kYQusWgQd6uAKj4HDRuwwIlTHcBmiumNK4hP7de8WqUyIEPcW2FcIUzNZ1aHlwG9pTz8h
	ikiZFNG0=
X-Gm-Gg: ASbGncujee0ajGMoF+b2e/0VzIPkWiudyJoxXLs4De15XKkcrHQT94jVhFMDYR+MME0
	tQNigqjkCuMk0qEX+XinbL6XpQJOqk6l+HpjHJYIkmQvAbAC6pWJtPq6jJljSluvIHvRT7sSdbu
	BsJIfmmSTRCC7PV07smAirMdkpb0PCoLpIxSQa2RPnI+rH9oReAtH97148vPRCCsOUaH2l7pVdB
	hqOvoZtPk1xhdX3/3p/LVUad/0hJvcz/DvEx2uIVefosJdROwoSP86bCfiMk2JfEN9DLl/Hr6L4
	mQeq7sqx7rRBZoluJ69XafPKVzZgwX69AbusHbFVkXlSlGzfu8YdtvJjgth5ifoPTAPfApxjVuK
	o
X-Google-Smtp-Source: AGHT+IHRbOM7ma3p28dCl6i5/2joUrRoZmrADPn6tljhIXUnu27s94ck2LDSzPrDTEtJSYt8rUqnkg==
X-Received: by 2002:a05:6a20:a115:b0:218:c01:ddce with SMTP id adf61e73a8af0-21fbd5d90aemr223503637.40.1749835090617;
        Fri, 13 Jun 2025 10:18:10 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:5219:d969:f11e:ad3c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d29a2sm1915223b3a.175.2025.06.13.10.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 10:18:10 -0700 (PDT)
Date: Fri, 13 Jun 2025 11:18:08 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: xlnx: allow single core use in split mode
Message-ID: <aExdUKf4JYjZt_nf@p14s>
References: <20250610192738.3095247-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610192738.3095247-1-tanmay.shah@amd.com>

Good day,

On Tue, Jun 10, 2025 at 12:27:38PM -0700, Tanmay Shah wrote:
> It's a valid use case to have only one core enabled in cluster in split
> mode. Remove exact core count expecatation from the driver.

I suggest:

"When operating in split mode, it is a valid usecase to have only one core
enabled in the cluster. Remove..."

> 
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
> 
> Change in v2:
>   - limit core_count to max 2
> 
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 1af89782e116..a1beaa2acc96 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -1336,12 +1336,9 @@ static int zynqmp_r5_cluster_init(struct zynqmp_r5_cluster *cluster)
>  	 * and ignore core1 dt node.
>  	 */
>  	core_count = of_get_available_child_count(dev_node);
> -	if (core_count == 0) {
> +	if (core_count == 0 || core_count > 2) {
>  		dev_err(dev, "Invalid number of r5 cores %d", core_count);
>  		return -EINVAL;
> -	} else if (cluster_mode == SPLIT_MODE && core_count != 2) {
> -		dev_err(dev, "Invalid number of r5 cores for split mode\n");
> -		return -EINVAL;
>  	} else if (cluster_mode == LOCKSTEP_MODE && core_count == 2) {
>  		dev_warn(dev, "Only r5 core0 will be used\n");
>  		core_count = 1;

When thinking about the specific usecase where, in split mode, a single core is
enabled - can it be either core0 or core1 or does it have to be core0?

Is the code in the driver ready to handle this configuration?

The inline comments you already have to explain the possible configurations
need to be update to address this new usecase.

Thanks,
Mathieu

> 
> base-commit: dc8417021bcd01914a416bf8bab811a6c5e7d99a
> -- 
> 2.34.1
> 
