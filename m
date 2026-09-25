Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E98E4E1C7F
	for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 22:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790373607; cv=pass; b=OlDnBdOizHx0A4w/oYJI3qbIebth7vHnpus+94IMmLTQGlY4Jf/RVfAS6gAnXFsDrZwJEsc00i75MMOS06LCIVs1xm6GYbTiNooCX9iRKOAqGbz7oS4UB/o/tGnTHzm4Abydd3uPlNCbeUKe1CBFJ1wyp6kFoSbvSJuL0WatP1M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790373607; c=relaxed/simple;
	bh=MxdQLe7hyBl8hjFd/SN5xKlhnp38XIhnYsFcGcSz7cQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/JsXWcSqKgFDTkpnBi1Zve0ZDxA37sG/bTrRC0JQarV9Xj72REL1Jw9AUFb2mvinMDmUA6jBxeUBh9U0v4p/WVUAwmyEiwqemsosnCgIYZ2o0fNUswEnG4LQHHiaqN37qUt2gYnQNG3DqKNK0HKmXYVjl/jURs2YZaw5h4RKyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuSrOq2o; arc=pass smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuSrOq2o"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a65a351692so2246071fa.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Sep 2026 15:00:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790373603; cv=none;
        d=google.com; s=arc-20260327;
        b=qGwnZIoThYtDtswfnyHq2XM2HxEp1cyssb3aAKy9m69LRe6NxSId+Ev0GX6DUjhTif
         GNcOhhRRLlWweJCtCZ49t9cipLqpLxF1cG+isYUjEUzQJByYebipD9Eh1BsalJjW1xkr
         Zp5cB6ZskvIaLWTRVnw2tk9upZaZbN4yCocOBK7AZzj1eRHGwqWgsVHiu/F8/NjKGxHJ
         FeSAy13j5nBmhp/c7yNwrq4h/i728Gox7lTF4So3nFNt+KNHqCOeZeK5p9cDVR16PXtA
         wBLtmQmfyLhDU4e0H/eh/NXs3FCeILFED/Z/7erU94BtjKharJx5ueRlH4gQhn+dRTrq
         EnUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Ovx48gw0JCa9z93E+yMUXGbpBD5xdcukSN06uG3r4cs=;
        fh=satggXUsHY68+rAjyVjE81pm7MFUz0eDAbjOVDZuyl4=;
        b=ZUGcicw6BCcivL2LnkCMqHf1aaL4WbPBUblvz2WkGd1TwEAXwLQnv/RFHF8sdQdiEH
         SMgKBszGP6mcSocgZArt+i1MRXddwAcrzj1Noolh5CTGJADxThV09EmZLlTD2acawG9x
         mMiWVH8MIy6cHcFzim6TsI2vDCo4Lfk0rrkFzCVaNWXmloOLWzS5/XG37KIL4jG/OkQU
         P/LvQRvwRhI4wbQ2wKZb3KkdgOKzkqt3qwPmiwZa1TJpgc/rH524Af4ajHxmlsmS+hSS
         p1Qic7ZivkO7ylGwxkp9JBPESu1zHwFJgVmZHDe7WF8RaSKZZqz9hUNaQ97OsJmCcgNt
         Zb5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790373603; x=1790978403; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ovx48gw0JCa9z93E+yMUXGbpBD5xdcukSN06uG3r4cs=;
        b=JuSrOq2oDdMoL9VsnN1SwpkxEtNJpCeefrXn6BfwF0xa5EsQPeyrKs+jYzJnmJoD+U
         Dv17YBqlP/3BswyBDeC09Ue8VKeL+xrZjfua96AqNqd43vSNVzc/iteJzb7vLuecUx9o
         KZlU8vZ74xBw3SF0hULtoYxAuS65+Yf/RQuURgmH1QmEh2bE6NPav26Z2TUkuSX9zIPM
         GS2zHEigl+o0Lj8/PNOFAT7JdhY5W2yq+gJbNAx1IaMVUx+RzSsJtXw0B1zgCNtWwv+X
         kVjIaRykmYtUjMR800flULPXy4EnyAwRVev9b9UjOYRp290iiNABYuypztEnobiLgE6G
         FBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790373603; x=1790978403;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ovx48gw0JCa9z93E+yMUXGbpBD5xdcukSN06uG3r4cs=;
        b=cnuePF/yZDduPMwy4u7zZejSmAJgSiXH9ibNi079kOy4yyn6RZXrjS4UZ9LU42zE3e
         5mWvEP7lHVVpUEdEnjY9c3pL0g89o+s9nuwVrICDGPUPPkeBHTQvW7SbLlyI/deEDtQn
         wa1Ew5OmB96W+GY6lMjQ2G9p0e2s9U7S5R1DUBJzhPoEOxn6WmgKMccFUxe1aFPNe+pZ
         bdHdj70sj5Kxm2mi/CoPwiX0n7vtzk353Kp9BsxM1GaL5G4btfMtYY1srY49K9WtRLux
         UhhuB9WR2VDW9uoMFUnPVCXLHAbszlUux45Q5RpRPtIky4ab32lxhuDn3dZrmd2DK3ze
         kZOA==
X-Forwarded-Encrypted: i=1; AKwUvByBxK9P+sBy63NL2Dhhhd35JdbjT2eW3BUUlUfeL/9wanw88CnUqrSSgRz7pomzpmQWNzd9/yM8PZZxqBivhu4x@vger.kernel.org
X-Gm-Message-State: AFuF++nG6EDh2aUKoxl703wkkTRm7fsHMjT5+TDz0n8r1CVuS5infVgL
	mGASk909mrm+jAfhUa/J2FepgBo+oMTnbXoXTI8Yl+91VDodKcPBCZsdzCPQ3Dk92VztzXoGqqt
	DSHIFk/aFu7dW5bTk+XT2jAKbnUZ79EE=
X-Gm-Gg: AYBFou0FePYgQ26yyIwatQwc/Vxye/bDCtBSWvY7NJM2nc+nl18Qm9Nui+v689Ro1pe
	CJa9T80bf5weXRCpZh5WvvqLpM3DA6pPw0CHXmi4UhfpCJje/I+MVGS8MNIFKO4uJTqrvDhHUFh
	ZSKikPzfZJ/arSYo9SUQPd0cV0QeobWNcVG3NMWYVt3HMhoXPwKD28kJHMzQSgMu0OwQNs/ZvmY
	jJOwt1Cvirz2C5oEzhqttusD7Y6d6ZZ8Fwfbp0QOLWhTCjzk42gEIdYWSP8XvegyoNeAm8TWpho
	SRanLOth0s9YnVINQK5hFhpWo+a8QKfNEOyh5C/dwup3+l28egKFtoY=
X-Received: by 2002:a2e:a9a5:0:b0:3a5:f911:12bf with SMTP id
 38308e7fff4ca-3a63c0b0486mr17043371fa.4.1790373603049; Fri, 25 Sep 2026
 15:00:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922190159.509836-1-oss.patchbox@gmail.com> <araXBOapuzox1ljT@p14s>
In-Reply-To: <araXBOapuzox1ljT@p14s>
From: Yuho Choi <oss.patchbox@gmail.com>
Date: Fri, 25 Sep 2026 17:59:51 -0400
X-Gm-Features: AclHuK9yIriexrqyiVeocPPSkgwQzrfkJ626VWzsA0WLJe_KCr5Mt7oEw8zUrxk
Message-ID: <CAGG=RgB0WAPJHGNYTw1W5TGcsykKgJT=yixq2L6hsCGVKhUThA@mail.gmail.com>
Subject: Re: [PATCH v1] remoteproc: virtio: Load rvring->vq once in rproc_vq_interrupt()
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Sept 2026 at 11:45, Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:

> We could lose the CPU right here and meanwhile, __rproc_virtio_del_vqs() deletes
> @vq.  I don't see how READ_ONCE/WRITE_ONCE would change that.

You're right, the single load only closes the NULL window, not the
use-after-free.
I'll send a v2 that protects rvring->vq with SRCU, so that
__rproc_virtio_del_vqs()
waits for rproc_vq_interrupt() to finish before freeing the virtqueues.
