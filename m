Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8911E1E1D
	for <linux-remoteproc@vger.kernel.org>; Thu,  8 May 2025 06:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746686921; cv=none; b=bzhaEsbPxNzneIy/XT4/4ao2ZNoHp6UnejCoS31q+utsL6+rDvRVKD/y4ysCKMU+jepoli5wEuj5tZgTqrsGtD+tcOP7k0Up1XdHnQoXfBBLXVhYKC56HHC0aDTAMSGSWUapF10f3hOLqjsGiTtB/V+XIOzGZ7wFhWAHUDQqcVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746686921; c=relaxed/simple;
	bh=J+DaIgmJc2plhSf97aDyRcr9UEcA9j0U/cy24sN24Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pXOguASO7hQoQbArGoeQ3GnMXXb/rkA71Ocf+sOJDTjhOHdoiOJQTTjSWCGwYFQ5t6+i7hURa3nBCpGCUQcIqQMOaGgwWtGo6WfqqIykteNaBweN00EsHpWnl4c5xU4zuSRuzuoCxXb5NKT2gQUaSkady1+x2pegS2kE372Cby0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BfsGDDSS; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BfsGDDSS"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so464077f8f.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 07 May 2025 23:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746686918; x=1747291718; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oN/u1yOXlCYt4DjjZZ0j855cjiGoWgslKBLO+dZCp3s=;
        b=BfsGDDSSIvF4sf9pj3wrOBnzwCxvnw4Z3tjuMSabkpzOWXHI7xJz1H+7RxuBOTu795
         CopYY/+ooRfrQOSxqR6teIeUtd+CFhyjym0H3Ia3s16qTd7/8ljwlocQ2KgLFtM4YUyH
         UxPrHXGf6kuyR9vp+7/uYd4+98SsObsJd4J/O7YvuTamezH7IUHue3a0Pqpb90zYbOsP
         OoWVWNgQo78pTaC7nItp631zoG+iXjEczMHIEaYZe+LQiVjt+a8AzPju+qOZ/NFi36Xv
         CbG6hFK44mrrytI5Z1k9cxJerYV2twnxV9GyI4my5zqudFIlsDv/wwtDu39zOoEQTiTm
         jF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746686918; x=1747291718;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oN/u1yOXlCYt4DjjZZ0j855cjiGoWgslKBLO+dZCp3s=;
        b=jobxvPoqyXMlTr5lCqSMKWiraT7eUb6CLqn9xzx0uJi09ssycO756R+sZJwT0zY2yB
         iiGJiKhWnR0q7bg72s/kO9skUoYf0lJLBvbXi09l90if0z4VOULwiEct3TK+o3aM+tkY
         pj6O6rmJ6IgYFHyLZfiVppSAE+UU2ke22/ULyCQWyoE7bIpnmPHO4z6azu3g6lIcyTJw
         icOmMluHkLxPRl5K2hJmAgef6TEvVIz02fmFNhFmzkN7ygEvtGqCcdQs96h2fcPXvzzw
         THd8YsLEzHd7ijM5prkXDD5DBiss3KfCrYoqsN7XhBGcdZH297i5+Qufv5qMt+I5sKaS
         g4og==
X-Forwarded-Encrypted: i=1; AJvYcCVF31BmgT03xREbf9OtO0OtBxB5iQbZRPi7SK8SJJko3i1pxHOm1TWDHkxrvfzVWsL3lDjprfgaDZT3WLDJmKm8@vger.kernel.org
X-Gm-Message-State: AOJu0YxiC8nGS8jJUbWzmqSV/7cvtxaq4MEMYmfnPMTrOzKzeTDEScss
	WmIHG1ZFfMP2ZycHzNOgRGAPsT/mhYBIf/bR+cDNs+6bscAg2++sbfK84ntN0UA=
X-Gm-Gg: ASbGncsr8mRDso7+kDAXqDmOj563qiQ5FixJCe2lMDkgYoOxTVQg9whFxJ+8Cqn4/Tc
	79poa1Rx7jHF1wvPgfY7HPwZxLTAx7nV+SQKO+iag8h/QCZKb/UKDDWrgcYBTtkWhbs0gwVqr0q
	FbixFAJBAVQjAXJp35G7/UkA3i0w0IRSKSTQbO3rE8YuqpUAtvfDLKyrzHcSUtVOujIwsUYze5o
	Qwa6ASYbNmY56Kl3hBZeZKiapONup7gHjOxwIO74ntR05JuI1QKR9xpEHsusHMFqcKyCyTpfGwk
	ft/uwMci2N7dN4/Y0ThjgxDqsuYL3uCWCOl3APjVA23/7jOebdxZebwr
X-Google-Smtp-Source: AGHT+IGABSvZpPx8hobskr6H9QpVVUUq1xHoj+hrZLygN8wQiQyv3UOkrESVz2X/i1IQ9NOEjwb+4w==
X-Received: by 2002:a5d:64e7:0:b0:39c:2692:4259 with SMTP id ffacd0b85a97d-3a0b4a19281mr4086914f8f.21.1746686917754;
        Wed, 07 May 2025 23:48:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442cd38179csm25448035e9.39.2025.05.07.23.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 23:48:37 -0700 (PDT)
Date: Thu, 8 May 2025 09:48:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	stable@vger.kernel.org, patches@lists.linux.dev,
	torvalds@linux-foundation.org, akpm@linux-foundation.org,
	linux@roeck-us.net, shuah@kernel.org, patches@kernelci.org,
	lkft-triage@lists.linaro.org, pavel@denx.de, jonathanh@nvidia.com,
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com,
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org,
	hargar@microsoft.com, broonie@kernel.org,
	Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Marek Vasut <marex@denx.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] rpmsg: qcom_smd: Fix uninitialized return variable in
 __qcom_smd_send()
Message-ID: <aBxTwhiMelFjvrjP@stanley.mountain>
References: <CA+G9fYs+z4-aCriaGHnrU=5A14cQskg=TMxzQ5MKxvjq_zCX6g@mail.gmail.com>
 <aAkhvV0nSbrsef1P@stanley.mountain>
 <aBxR2nnW1GZ7dN__@stanley.mountain>
 <2025050852-refined-clatter-447a@gregkh>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025050852-refined-clatter-447a@gregkh>

On Thu, May 08, 2025 at 08:46:04AM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 08, 2025 at 09:40:26AM +0300, Dan Carpenter wrote:
> > Hi Greg,
> > 
> > I'm sorry I forgot to add the:
> > 
> > Cc: stable@vger.kernel.org
> > 
> > to this patch.  Could we backport it to stable, please?
> 
> What is the git id of it in Linus's tree?
> 

77feb17c950e ("rpmsg: qcom_smd: Fix uninitialized return variable in __qcom_smd_send()")

regards,
dan carpenter

