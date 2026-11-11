Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794363541;
	b=ycU2bpD1WIsxD9QJbr6+kG3ewoTT3FjQL1kKNkcgoW9lcriuHEBQnyZjGe2c3ucIbc6C
	 QuQryARjiZA/beQT+wPOQWQOmnISP58tM0d36Mh5D/8jytIo12sFdwrr/8qH1gfwyGE2s
	 fpk26cCWsCUCByKuUZLR5wLuJ6uiDrFhuI3eHJtMTyJvxWNqsGOSQdRX165GC9Q+hdrTF
	 XYFYT7n2xAqfu1oCdjf+OB9Im9LkI5nG+JoHZpud6YJTiZaWp/QQrjq3bekJK/SjFzx40
	 TjbpDPhwteEirTVQqlawwlVl1gLDxoyCVublBO/GhYvAlgWRxOdd7XvE3ON36+GHi9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794363541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2fMVd9+BG4VO7hqMxKMuY5cqj5bvPICv3nSW+GWLiOc=;
	b=dAJexBeslfqWhVBrZCPLhZAVMme0VnmpGhzKGIZrX5OlrM4OzMSp0LwW24Rp68D4kqpG
	 /M6GPU/j32PiMqV9AApC8f8kx9TQDZ/b5uMvs3NlunHdrIk/7qq31+QcCaVMw/ii48nMg
	 Faf5LXg21ovhdCZfKhru+F0YNz2jG46/HIUG9x1p93hAd4EFrprujuTnd/T7CXJeDd2lj
	 Od0XBUfahyvVMzSf087hU6CGCIMG8orqzQqhhmoh5ZHwVr3H5svmQyn0/YJTfGBvO4oYN
	 gi3x+4YzW0VJGRm3jwFAHRP/G6mibDZJ4RTWvFpTcdZiYAKMQQpDxyD/J/wRLqAHVcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2krku+Y;
	arc=none smtp.remote-ip=209.85.222.49
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE455606A326
	for <linux-remoteproc@vger.kernel.org>; Wed, 11 Nov 2026 02:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE455606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m2krku+Y
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-9950a7530d9so1413633241.2
        for <linux-remoteproc@vger.kernel.org>; Tue, 10 Nov 2026 18:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794363539; x=1794968339; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2fMVd9+BG4VO7hqMxKMuY5cqj5bvPICv3nSW+GWLiOc=;
        b=m2krku+YjvL7RwAHdVnX5JwwsKjAmCTwylPED02piBX5bjzoH4ibDEntBz6HiCdspr
         nU+8QyqtiUrsnaUjbaYHQsStgBvg3X/67QQ8hZWYApOh3F0ksrsMTvGJaDQ+1AZ8V3Ct
         6Q40Jf3UD9YQQyYjI3//L/0W33Btupqqz8ivO5Z4dVW9QRngt+HFPgenN8crFEGxGDdN
         VCRHCwsc1Q9F4g1OW695Y1ARMEyvtjb6LFZvr990hyM+jF8q6edfDH6irdZbQw3/uMgV
         MF0pBlfW+dCPMd38ESEFm7u4AUX02QO6jSr1JCTX+pbbweQ6MprJg61/EDmyOC6ZTryl
         /fKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794363539; x=1794968339;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2fMVd9+BG4VO7hqMxKMuY5cqj5bvPICv3nSW+GWLiOc=;
        b=lEIkMqzJQaMPAWTGhSSmEWTgtraK6eqnQMaYun40EPtHZWbg+WcYnm/ttpeHqPtYvJ
         iiBXcRifKTh3H90vdW3+SoKhyqjXVxfEWopU5zUovOab4WERLCRpD+vsFOYTXHzHu7Nf
         KmOizA2LkWqqSczHpfthzJgAVWCHTR8HtuaEsbwfKmM/zhnDOOU/brA4tEnaNWLV8aP9
         r4rutQJ4ByZF0pIef2JllE85cp76/FFEWobPUSTcKVDv1iyM6J3Zu14ftsVJJVBHjT/3
         CfO4P9LbjBR6IddaGHhAZFtMOm3VU+TWBsQnEBawARvDLMLTR1elyE6vqXWyDg+WZENE
         qtZg==
X-Forwarded-Encrypted: i=1; AL+hErFOk4O5sdi7CiPZ29jhavSoYADY/ykVknmZ/74Q4rljtSgE+oWfy9ILvuHFtZcCgakCLwi5VGOQQPb8YJni2gQ0@vger.kernel.org
X-Gm-Message-State: APuU4Z9IhGpvJUo3Z1DdCZjulyESrogRDH5qHT6UPm1P1lRGN5K+Qv/L
	vObMJDIBDvbsBhlLkU/+aNrRHezx9dEqEow+LEveICIgj6XUCC6vu7mB
X-Gm-Gg: AYBFou3aJtVkDW9UYtkSt2i86MoYYw9SiFFZT4kHSR26Papf+kMYJ5CNYO5RTzJOtcL
	w8ruHcTESGEY7KYkHSl69lS8nVZnRIxLWJCf/aM068X1lCIwLeqWEtVZ1MyEYYSu8YTTS/XE8dB
	EV9bsgMCHpRKYqqtbWyaFVFIEZLj1R2+jjOrFDoopi+kqoagT4R+kGeQiIH/3k67V4QAwT1PX03
	UaqMEd+gouumUbiFeD+z0yKx1R8vLAzH5r3xBvxYV5KbDRky0Nx76s1b/gZk2cH0Mmz7IgpjFvA
	XUwUTh+oz5YxJXMmy6inxQLRUFMiUtTYIao78grSW2JYGjfYRnLoqe+dDRvkppNuKlC32vqnM0o
	ue5rGl9yX/7S0U0fL+u5PlKBXAbeZXEN8sqCQGo3ZfaM2RhS8nxD0xUE+vAOqpFkBI3dY4lKLe+
	Z+y+07ZQtjQ0kgplyLl9gPSlqbrESEC1+7JAefFeOBOxzl+XV2cf/4DwIyz3+KNET/wF+5bZ6UL
	x8O18QFnfckUA1KmCo13noEfQ09C4eqtcfJzW0qB9iSCQeaWhE2/B7pYMVWjsth1Nq8sLFHzfQE
	xM9nps+ebL5AfEga3AN95JcndQDvnVJkfDzgCRi6e0ngRZQoFCk=
X-Received: by 2002:a05:6102:5092:b0:7d2:c786:5a98 with SMTP id ada2fe7eead31-7d4fb2a44camr283379137.8.1794363539520;
        Tue, 10 Nov 2026 18:18:59 -0800 (PST)
Received: from localhost ([174.93.36.89])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d3023aeac7sm2888590137.9.2026.11.10.18.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:18:58 -0800 (PST)
Date: Tue, 10 Nov 2026 21:18:47 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/9] ADSP for SDM670 and sound on Google Pixel 3a
Message-ID: <avPQhxfKOpmihOTo@rdacayan>
References: <20261107022453.159341-1-mailingradian@gmail.com>
 <18dee813-d4db-49c5-9ffa-7a150747a4b5@oss.qualcomm.com>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18dee813-d4db-49c5-9ffa-7a150747a4b5@oss.qualcomm.com>

On Mon, Nov 09, 2026 at 02:23:15PM +0100, Konrad Dybcio wrote:
> On 11/7/26 3:24 AM, Richard Acayan wrote:
> > This series adds a user for the SDM660 sound support code [1]. It also
> > adds the ADSP remoteproc for SDM670.
> > 
> > [1] https://lore.kernel.org/r/20260730174353.108023-1-mailingradian@gmail.com
> > 
> > Changes since v2 (https://lore.kernel.org/r/20261003175659.23536-1-mailingradian@gmail.com):
> > - stop using fallback compatible and add lcx power domain (3-5/9)
> 
> Can you share the output of `cat /sys/kernel/debug/cmd-db`?
> The SoC also has a LMX domain, which downstream seems not to wire
> up to the DSP for some reason.

Here's the ARC dump:

	Slave ARC (v16.0)
	-------------------------
	0x30000: cx.lvl [00 00 10 00 30 00 40 00 80 00 c0 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30004: cx.tmr
	0x30010: mx.lvl [00 00 10 00 10 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30014: mx.tmr
	0x30020: ebi.lvl [00 00 10 00 30 00 40 00 80 00 c0 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30024: ebi.tmr
	0x30030: lcx.lvl [00 00 10 00 30 00 40 00 80 00 c0 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30034: lcx.tmr
	0x30040: lmx.lvl [00 00 10 00 c0 00 00 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30044: lmx.tmr
	0x30050: gfx.lvl [00 00 10 00 30 00 40 00 80 00 c0 00 00 01 40 01 80 01 a0 01 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30054: gfx.tmr
	0x30060: mss.lvl [00 00 10 00 30 00 40 00 80 00 c0 00 00 01 40 01 80 01 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30064: mss.tmr
	0x30070: ddr.lvl [00 00 20 00 80 00 a0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30074: ddr.tmr
	0x30080: xo.lvl [00 00 20 00 50 00 80 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00]
	0x30084: xo.tmr
