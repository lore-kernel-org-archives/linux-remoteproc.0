Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4BF8612C
	for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jan 2024 19:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706036499; cv=none; b=HYdYA51/i+KSOGpounxkPZ4y9L/Gpg///9kfyZVzcXK4xDbJj1Y1GnJIIQrJ7lHHcGpqPTBj7fNlYhtQkX1FF44XKuvw0fkMklkOCcXAoOr6dK8l2vvbG5QDy5AcVslBXOYPds24oP7FrwtLk2I6PpCtYXd1G42XNtMZo466kXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706036499; c=relaxed/simple;
	bh=n52gmQelYh1QZN+wh8CLuxnOS417zyDahjhNaQJIO38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1gxneyxpgFthE3zQswRhxMv7Ki0zB36Nhp0iOKzqk51PpcSgvlg5Mv1QQPeO/zIeR5NzZ+hZrrkdPd9yYTogr7OZeEDq3dezjkLdg5y7RpMDOelv7z8gbznxgRwCc2WnkrJQ7E5QPDa9IOvCteDCi5gdU5yNfQ07og7pQV2KRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VZykyNES; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VZykyNES"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d6fbaaec91so38512035ad.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 23 Jan 2024 11:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706036498; x=1706641298; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QftPz4jN6kiEorTzivfoGB9qpSpYd51y/PnesCdYvNE=;
        b=VZykyNESt5cVSiXwHR4uUunzF3lMuwrRqdlPZnuFZ/6w1iciEUZZa8B8lx3T3BaXlF
         6x5GKYU/4L2RgqOJHcQ+rA5XsTGyJmvFHGH1pV9/TvKUl1lCnU/SoPTMIMrLnCV/gD8I
         9vDGsAdPt7UZ1ck8obJnA/WQMFXkoCpG10+HtRmRriAd34HmPSK5rbLLIbumcv9qBMhQ
         kcjrHQp54tD3hNd/S/kFpPESZUcXBfTtZO96MKb/hKDnzaz0FfnfI+VamK2HitJN7mEj
         Lhh3euUEeucQ171WAkzuSlYuK6IXekHaDiUzlPjJU/CC1qLHO4RwpiH0WSTrzA6umQl0
         x35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706036498; x=1706641298;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QftPz4jN6kiEorTzivfoGB9qpSpYd51y/PnesCdYvNE=;
        b=Lz6BrYZgZv+f9pKZfhVp1VcXXCBE7DcCooH6XL8ru+pysSKJbxlUjCTd8z6foY8/RA
         uFDmHd6Pu7PejPksp8/nGg7+ere/bQvjVUYO+GJ/9zQCp5E78R2lJ2GqCT0Dcz7+5A+u
         ucoME9Eh2b+FsMRf9z0JI14dFXxGSjnTr/ZDkvv4dxH/3hXwRWP7T4LnSXVOjcdcPbby
         WZfX5fUk+smkLBLTAs4Ds0POAcmCtEBzhs8vdWxIDDMFGqwvzJKTymwvRPp4GHjuYwzb
         AGPdFQapLqPa6gQAsOM7w7QeqDQYQCVvL6ZJBOSSgcb+2x8retPO1aNwxgVXgTmp/WXG
         65Vw==
X-Gm-Message-State: AOJu0Yx5JDnaQLl+xlBs19SEWfJsIlUfVjseNhBj06IAup0svYDJyIUE
	Ok+DWsHQ8KDlFDiT3aJ2rhbhScRhFuTkdC7K1VSdHNq/rqMbutFq8lXFTZL5sUa4Noy2SgLvq8t
	k
X-Google-Smtp-Source: AGHT+IGSBclA+Hqx0rOpncJoFhZkG7syO/DKiq9G4IhsfvHgLmfHisQAwDJNkh3QWq8BBP9daPAqKg==
X-Received: by 2002:a17:902:ebc6:b0:1d7:78ed:4b7e with SMTP id p6-20020a170902ebc600b001d778ed4b7emr909437plg.35.1706036497410;
        Tue, 23 Jan 2024 11:01:37 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:e343:f944:5fc8:eec1])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902db0a00b001d7069c0302sm8956884plx.272.2024.01.23.11.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 11:01:37 -0800 (PST)
Date: Tue, 23 Jan 2024 12:01:34 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 0/2] remoteproc: stm32: Fix sparse warnings
Message-ID: <ZbANDtaHHY5CkC43@p14s>
References: <20240117135312.3381936-1-arnaud.pouliquen@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240117135312.3381936-1-arnaud.pouliquen@foss.st.com>

On Wed, Jan 17, 2024 at 02:53:10PM +0100, Arnaud Pouliquen wrote:
> Fix warnings reported by sparse using make option "C=1"
> 
> Arnaud Pouliquen (2):
>   remoteproc: stm32: Fix incorrect type in assignment for va
>   remoteproc: stm32: Fix incorrect type assignment returned by
>     stm32_rproc_get_loaded_rsc_tablef
> 
>  drivers/remoteproc/stm32_rproc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

I have applied this set.

Thanks,
Mathieu

> 
> base-commit: 0dd3ee31125508cd67f7e7172247f05b7fd1753a
> -- 
> 2.25.1
> 
