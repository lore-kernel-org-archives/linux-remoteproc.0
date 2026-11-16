Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.54.127.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855019;
	b=tMsK1fUaY/wBpA7QI2OQNh1SF924aFxmqdbEIkbBdVaEXxtVLnT0LhlIrgsAwmabE4xS
	 POCsLqPk2S6nbxwA5YEXwQYDPeiy7dBpoA5xpqhS/gravqPWwvD/1J1Ldu3hTcmOzdzCi
	 nUti6saLanx3znYVpsz8QTQ66BM/3fEzJF372s9TMFE7D6jFIWk1fddsMhk3zzAqgxrIU
	 refWI3sdRyM7STIxvU+RJdoSb+jK1ZXb9Q4sFb/L72JwfZsh93zXOHPDmB60WpfAdKNek
	 g9kOzG4YQqVBoiu56ZFvCDX3k5AvtpA6cb/ZTHxZaJJKNO8NSEUqclCElzl8Z35nmyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855019;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=DCHZYaWu1dPZB8pm/wvMR3k7jNPsdPLwrum599FCVB8=;
	b=PP4U7IPd+8xqDcN2PzTB2xzZGd2SinzpigClQsOdgk3J9wSIm2UkphkPYeXR2jkTo4Sf
	 2XREUSCQPXo1xPD1HV/LqMzKpoRR6pxQdIIn3UMv52bJ0n7GmCewH5JA1hZfZROcnACSD
	 IT2k1o9J58M3ToIYmmdt2Jy7312ApRD/dyIE0DNdiFjpHrOd+nuT2EY6rkjSF4QKcJ7EP
	 +nL29umnbWYGuZggvoOkrgmrrN/i9bM8pEELCi0q6GiH6CKNJfKwq2R9NUkpxK/S73K/7
	 41G2k0omgvOW/TCTeDlJnPscxtbMsnYyiF321jVz32zHWA+SMShZxACEjPZtJP2DS0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=j8mkQfv2;
	arc=none smtp.remote-ip=198.54.127.76
Received: from out-zbxj-a76.jellyfish.systems (out-zbxj-a76.jellyfish.systems [198.54.127.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DADB606A331
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 18:50:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DADB606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=j8mkQfv2
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jSxkR4JYJz8sWT;
	Mon, 16 Nov 2026 18:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794855010;
	bh=DCHZYaWu1dPZB8pm/wvMR3k7jNPsdPLwrum599FCVB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j8mkQfv2gol86ZQEATbWhu1dpi+BqUU1TMS0NiBuvlys4MF91uYUMhTOp3W7sGNLA
	 MdULthcG8wmfGWSHbWwLeC8lby3TgYgkWLEX0cZ0iHIhHo+4+5/iZJ0Edo9KBp85u2
	 +3a/6jyGVugx9KK2gGn+sOBrcFor3+81+HL1taIcdeE9fcl2iJT1ig0pVNg1aC7EnI
	 Bi7PVX6/j8sYnWNb6k4UgyFZKd+Tt5KbJM4KTXM260qXPa0VTgXsJqdLB0WrFI/04Q
	 Ccnq0hHbXzZaFBalG+EFerEYhg0z/z6vaCYFg0jNOJXjN5mUVP3gctEVFiAgRVnL9P
	 m5fwXYraCbVpg==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: francesco@valla.it
Cc: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: Re: [PATCH 0/2] remoteproc: k3: Recover a crashed remote core
Date: Mon, 16 Nov 2026 21:50:00 +0300
Message-ID: <20261116185000.1900725-1-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avoem-QRseasexkV@bywater>
References: <d22a1ffd-cfbc-4122-b11a-7b680985defd@valla.it> <20261109160431.720498-1-dev@chrispinetinega.com> <avJbc4Aebflkjgap@bywater> <avoem-QRseasexkV@bywater>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Envelope-From: dev@chrispinetinega.com

Hi Francesco,

On Sun, Nov 15, 2026 at 10:11:01PM +0100, Francesco Valla wrote:
> An update on this. Recovery is definitley _not_ working on R5F remote
> cores in case of crash, because the reset action that is required from
> them to re-start correctly is in do_unprepare(), which the recovery
> action does not call (while sysfs does). This is of course out of the
> scope of your patch set, but has to be considered (maybe deserves a
> note in the commit message?).

Thank you for tracking that down. I agree it deserves a note. In v2
the commit message of patch 1 says that recovery cannot yet restart an
R5F, because the reset it needs is applied in unprepare(), which sysfs
stop calls and recovery does not. The R5F driver keeps recovery
disabled, so the series does not change what happens there: the core
moves to "crashed" and can be restarted through sysfs.

Making recovery work on the R5F, by doing that reset on the recovery
path too, seems like a separate series. I am happy to look at it after
this one.

v2 also drops the duplicate crash print, as you suggested. I have just
sent it:

https://lore.kernel.org/all/20261116184146.1897281-1-dev@chrispinetinega.com/

A Tested-by on v2 for patch 1 on the R5F would be very welcome.

Thanks,
Chrispine
