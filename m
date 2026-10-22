Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698922;
	b=HapwqcgpbEakoT62rqiF2QCBFZTe96F3LlkPS7pvs1ZgBkJEG2aMAauykZQtgWDaZLvu
	 A6Miep4sJMWN4Tkk8RJMNMdVwDUAfj8HGBEFEn5Cl0feH0oblcCmpDtNLhBGF48q44yEt
	 tCFX1Df6LkOSAPqtHLVbFCm13KiJUkbw0p/cKii+4VlW6HfOUJgzk3YP5bNRVsxRUno0C
	 ioH3MgQal/BY6Cj/dYxkRgPRjLyGCJnsyQUPa8C93ta7dS9LfIlmgSwaa4TSNtOlxdV8S
	 YLTohi5LomHroUqOM75+rwaArxkSblT2zqoj2YURDiSNdu6MGoBWzZbRGJjDrRdCcOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698922;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9qxA+mjmpSVOmeaS7bsX0MCILV1F3DEdINdxxq5gFnc=;
	b=Ixq6lUFxU9z68B2vgz2uRmdJwApR9VPrZirOH9cU4MdcfaOVUGrVUosZtWAmAf3mGxs0
	 h0LuDw5NGXm0p26+jXfEJltk94VaHMVTSDQw+xui3ddNLRvIwY5HWVN5h3xA8oUVOifl1
	 t/8X7oUvn0PPfKXPjobziMlyuusxWvV8bbX6UCbTGjsN+Dz+AoRyGZaoQ/EFBsgLbhV6r
	 zvpw6uzY82IOz5vf1tW8G/ZDAFIkcN4mwVr/LUBMoD8Nj/lCm0sURxE8QI+wRov73EYbd
	 Ybt9rqjqodo+uuW3ZrTOXsI5PkImCyWfkH+j6PkFI1is6/ncym8pkGvBJqR9+hnA1PA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XXlGzFaV;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037F3606A31A
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 19:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 037F3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XXlGzFaV
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcb1f1358aso63300e87.1
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 12:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792698920; x=1793303720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9qxA+mjmpSVOmeaS7bsX0MCILV1F3DEdINdxxq5gFnc=;
        b=XXlGzFaVyYoP9OdV2Trb4gGb/5VHk3kGNDwHOuyx8hbNCvPaz03c45DX19OEfH05FO
         cno4yykPUZ6r1Lqx1OeU3hVe38Q2sCPNnE5AVeh8SQWSY6IqMlOOaEdERbK7tOZTGCrx
         y+/tbDobOSeSgPsUsTpEL7Bqmb80LfRHMGVxbyHP7tcwfjcwBsh+7grXSTEZRLLBElx0
         VT/qAZNkaZl80MT96PdYpo8s14sJJcpwlYgK5VUHqQXPUh4nH25tehH+JhSPgyUDh8p8
         l/ftTF0sIV8jp0WR7VFy6m1qDPn4RHL3wApfsTUNcBvjZQbNx1UjBEDVaH6deYtJh9Yi
         A5lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698920; x=1793303720;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9qxA+mjmpSVOmeaS7bsX0MCILV1F3DEdINdxxq5gFnc=;
        b=P12Jt7iEwCWBsqtIKiZHaNusEhnzfWwfussU2v20RGSS0JmEIyGjQ7lpDcvX+vU5C9
         DtlO40gMtKsECiri+hilH79Yjpj6sY15hbWQStewo9nSYFH1cEzOapLhdD53a1W3BDpE
         SYoVVai79SNVuKp1HZUnRVdwtJFk4aTmh4JTbF+x0zOIb6D2Nxv1h8VxAAUUGjfOG1ee
         KDKi6o0p3DlqHwvLWj+PL0K9N6msRsOY3U/NtNZg92YpFF4EiegTm4fqJOM9RQdegAyd
         TXH0Ida/7Dnm5YyT+iv6ecZSkQxGRPZQdqJ1yN56bVomnIbNCKSQUkrwjkC5TVKd0Ek9
         n2hQ==
X-Forwarded-Encrypted: i=1; AKwUvBzjaZPtYwwNB+fdtQcLHSs/yTRPF/sKHzh3J7/wXnvIIVYlpdyUFUchpJyRhAqPtCaegGf6NBT48PsEkZxP5pZG@vger.kernel.org
X-Gm-Message-State: AFq9FYKxSedKQRAOs2VDGayH26YiiIa+ie0Rr/aGokXBXLVJ5xHDqNey
	HBHkGu2j9r9tfodpTTizTwqN4hwJ5DG2uAo9TVThty9GJQQrD8ANUWxQ
X-Gm-Gg: AYBFou3HTOIeEThnQE1lbV5ujgW9YxQHpienj8RDDv7JXqKuXNeGX2+xn9303yg25uQ
	NyOn4dBeIjtof+J1kABWbkFO/wHpEAKTG/Wfs+9quanNGQ2pF5T+eyxY75kS/FHLVu3NPRfOTAv
	NOYAK2aR/6RJQw4r57qkO4ECAo+T3L7Wn8MbJfBURM7pgiuHQTT2GXH5aBMU65Xf05T1Ct+XLZJ
	18m4uTi81bhmETJ/MmQ7b0auVS3iiX7AkepTVlcXm1MtXfxIq37QD+SttX9V6FpQKicQtUPwA9q
	RAj2d9tj7aS9orxAd6a+crzAVU+jp9LPVz92suMO0SYZ2Ct3vJC4cPfCoRvN4esxT+dLcmSRq69
	jQ6GC18vQOFSS02/v0KKHxF4W2690nsbEpjwM6idzcTc5bB9fPl3WDlWDadyha0TSqxXnD7c8Wd
	76+uapH1MegSaFxXNSPvPtW5XcM3+I7QidlO87dYI06H6uhsgQdU3dgmntw9/mUCapPNBtFs4OB
	PfuqlBSXE1+1n4sqnH83ju5IkRCP3edpJXJ8KP8arochGlE4SuWv2r6MT4JuJ+8kUOsZJAZ7non
	PwThE/2X2cHNipOyag==
X-Received: by 2002:a05:6512:a83:b0:5bf:af5a:cf26 with SMTP id 2adb3069b0e04-5bfb06cbcbfmr4297e87.2.1792698919896;
        Thu, 22 Oct 2026 12:55:19 -0700 (PDT)
Received: from ik5070.localdomain (82-131-69-225.ip.elisa.ee. [82.131.69.225])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-5bfb027d0a2sm30503e87.36.2026.10.22.12.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:55:18 -0700 (PDT)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] hwspinlock: sun6i: Allwinner D1 and T113 support
Date: Thu, 22 Oct 2026 22:54:26 +0300
Message-ID: <20261022195447.2007440-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261022211952.7293f8b6@posteo.net>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog> <20261022190203.1998156-1-indrek.kruusa@gmail.com> <20261022211952.7293f8b6@posteo.net>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Wilken,

I observed something like a 4.5x slowdown - around 12 us per take/free on
the C906: the loop with the lock runs at ~14.7 us/iteration, the same loop
without it at ~3.3 us.

So yes, the effect is material.

Greetings,
Indrek
