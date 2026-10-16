Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3F83546E5
	for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 14:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162137; cv=none; b=DJm2HWaTQwHfJ77M6uVf0URf302r12Z53uJIrZ4DtuBFvY/qY3GpUrLgLzBBaAIEfuQ9gVCIfhh21ftDfFukk5X0lQMtS+W+HjW3j0S2jLazeEXMQoMU4H0YB+tyAAz9qZvBPMIdlWFK46bimerHj8qCv5kOsU2KEqQ7t9CjbcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162137; c=relaxed/simple;
	bh=gj3wE3tKC5/eIlP+bFvEKPBktyUQp6ShnPK82oCwDFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nG34+rM3o7tH7YX3sJK38Cyv1CrXALLDwZLmvl7L+KE5l+1s34mn0avORf8HU6qlZWhtxxxv3ArM4HXH+gSj9WzgXu0tusas0lPotxNp/nq7V7vDFUj9XN5jM3L6ZTfOdmQrTnMDz7gLiYq4s9fAYNOdF2A1ZBScLE19ZeaNuPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lT/kzjbN; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lT/kzjbN"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-89f1318195fso658308b3a.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 16 Oct 2026 07:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792162136; x=1792766936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=euwyB0Hu9EKnWTfQGDAfCyg2u8gsMszPEB2wlSrIzaU=;
        b=lT/kzjbN2ELM3ANZrQKeajMvfT9aGBEfMwbyQ0KfK3TwX156iwB6Ju0/PJcb8li3ux
         SRUwzrxIXjdL62WGQlxCFwsqFajXoXjZyiW70AD53UOStiJ08paqZYSDYn8G+7yyTNpY
         4UKb3XorvPxp0KiBw1nsFLDgs279/e5GYi5MwYFK/Yzen7rBET98cRWmj/kew7SnyMI+
         kgmeucauOodhoxPuKAcSoac5ekyrqHwOF6YIbdhfeJ3MROpE3Ez/PPAAsszNC6hBrLKa
         OO+YgiGaZVO5IS3232m2f+h3XbHhK7K8zeuYVUFlM4qwGZ90VfrqjCkEtuggW5faqLPy
         mAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792162136; x=1792766936;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=euwyB0Hu9EKnWTfQGDAfCyg2u8gsMszPEB2wlSrIzaU=;
        b=kGSkprRBOGQs+/3SNqEeyG1EZB1fPgs4LrzPm+nB5wmziExn4odBk/sZipfiQd0gpL
         guN/4jdo/TG6vgKMfBPPjIlnI1imOLGJ7MJDmct0t5tqJp0sSSMN0sTLwg6zNY8cEMv1
         GiVNyRvri2OKq0pB3i7J1HcaodDnlnA3HanxuJqETkAeT8jFq5xkHz6XyDNgIoD8e36G
         drmvxtBQCWOM3jS415QmmZWdNPKOf99KySNHdlbkXkd22gbx2XEVdtfZXgJvSn88cd+k
         4un3+ocC/cOU8S770pcgAfQNw32DuEheLlSj6TvOWOL1HD0lRAX0Wa7pdZ4hdQOPuKhz
         qtlA==
X-Forwarded-Encrypted: i=1; AKwUvBzLTxyCVOeHgwIyo0QiemEQ8tbZnXg/fR1INiJKiCbGwZUSwOgqg066IHl6pEJm7+97R+NlhTGFV2TvVRjbP8O0@vger.kernel.org
X-Gm-Message-State: AFq9FYJUkVsfhM9O/N2yLerKuI+e2FKCiAeQWM7/mX/KZNSNp8DzfKTR
	QZ2Mj1Q3lzYLFDX8nqGJtqFreQaAQkWprSc//OwxqTQej/6BneTAQOSg/v/QlPEWgho=
X-Gm-Gg: AYBFou3leBFd+mB+x/mqTy7UbPS84cSQcbUuWtmdqQW9gqbKe2zInjfkMi7d+dtd2/b
	Fh1GPrIggkvUC+u1EFJHDSCAIhl6XgvecrofaV20N8fFZw+pKXCIwo67MPEe2crDtrBwnwEYO5J
	PEye45yj82SThlhsZhhPv1en6OlsHHKvhnZ2jBcsvY2CPMZ1ywmS44UX/TtCaVDMA0/xTtJ9uj7
	Z6ySgvVBcBmuqGBmqBxUZ8wb0KC0cguW7u8TsYFelktFL4e0DXzEgp6A4K3/+CROwQrkfdrSL9U
	InRwSXV82OoJv53D0ZmXE0HmGndj4/QHFyws/XMUnaPhdyxu/xVxx7fu0zs+kdRgFTu2AAen3TR
	r2Ek1JUX+X3QjutQMsJeF2Ypo0egeaRc8LR3uI8MLS1/8NXa/MR0iNbdwrFkgNg7EaG7Wzq6v9Y
	Pi31P51UU1UWFJMXje0+x5hBZpz7QOdF/gi7LUfYkbAAzsAVbdvC3VyOvhVL77eUe44OF6b8JkP
	A==
X-Received: by 2002:a05:6a20:eec4:20b0:3e1:bb25:126b with SMTP id adf61e73a8af0-3e1bb2515f5mr8280336637.36.1792162135553;
        Fri, 16 Oct 2026 07:48:55 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:ff2f:8a9c:5623:f753])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd654850c61sm1273911a12.1.2026.10.16.07.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 07:48:55 -0700 (PDT)
Date: Fri, 16 Oct 2026 08:48:52 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Atul Akella <atul.akella@gmail.com>
Cc: bjorn.andersson@linaro.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 0/2] remoteproc: mtk_scp: fix da_to_va() bounds checks
Message-ID: <atI5VLH_CiIBu0tq@p14s>
References: <cover.1791198233.git.atul.akella@gmail.com>
 <20261015151938.1331-1-atul.akella@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015151938.1331-1-atul.akella@gmail.com>

On Thu, Oct 15, 2026 at 08:49:38PM +0530, Atul Akella wrote:
> Hi,
> 
> Just following up on this series. Both patches are compile-tested only (arm64 defconfig, W=1).
> I haven't tested them on actual mt8183/mt8192 hardware, but I'd be happy to help with hardware testing if someone has access to a suitable board. I'm also open to addressing any review feedback.
>

That patchset did not show up on my radar because it did not include the people
listed by "get_maintainer.pl".  Please resend with the correct recipient list.
 
> Thanks,
> Atul
