Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=63.250.43.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855018;
	b=mNS+YCV8/JIj5ksI9RtT3Vl3qaWShKyks5KeWshCj9QxPsaFWcyH32hUgHdvGQEzWR1Q
	 0E269503FlDfzf7w/HWJgeVv6N3ApARb5gGO+wQz+tFkHdCRtL65Uvr+lkOCepFlstCrp
	 QSXy08chxJ/4xleveIRvZy4W2GEZWD/UPrJfnoMQDrR6S0UBhwmNhvims1wfehw29X3qg
	 6GnYxR6wCsl6AWMFfy/1pzsrZHfuyAyZJFli52cCyowuFTwZUvW8O06xvqZWpMmqMqy5O
	 FMgwKB+++DaP7ALD3U0/LfsHSYzMeJjQkYf2qoI4WhKV8V5MvbYx9Bi2/KOc1Ewnp2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855018;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=vdb0XB5tbcxRoHmRNGigJWSGFyafmmBmgtOwe6odnDc=;
	b=gz7/oiEzjgsZtrrriVvpx3Emg8X9L0yrFSpcGto3nGwwdy9TeUVvOGawHHpCzngZuimg
	 utbZJrTbgJH2CcwBSfDN66JQ19oHz2KNCIUwntS0m0xF/UwRVGX09P8DfrDTybjSg8Pxt
	 4B1bG1C3rYbn6Z1hVvJjTQ6L1/EfFVmmKat42c+LjklShQcVJZbcs9cF+a/b6XyeqJC5Y
	 DOhWutSMBffn46I1Blm54Y+hycLJB5DiYVnvU/Ybm1vAPrOP+glYfD7MguOLRtpbXxmYx
	 OQ7RmvlNBsiISQnO57v56D53flZNyN19epaUJACgjwHHmC6Dx7xxnl7aaLxAog8E0lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=k6MHEM1y;
	arc=none smtp.remote-ip=63.250.43.100
Received: from out-2uec-a100.jellyfish.systems (out-2uec-a100.jellyfish.systems [63.250.43.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDB7606A31C
	for <linux-remoteproc@vger.kernel.org>; Mon, 16 Nov 2026 18:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCDB7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=k6MHEM1y
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jSxk664Kfz2x9D;
	Mon, 16 Nov 2026 18:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1794854993;
	bh=vdb0XB5tbcxRoHmRNGigJWSGFyafmmBmgtOwe6odnDc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k6MHEM1ywbJ5rpC2qeQAay1+Y34A27EHFPIRkIpLRlk0gY65DyDbSvLTETJdsCFuS
	 2FJYuQucV2NQOf+PdCPQBBS32hD+Yn1+rsQQKrQFY8LEa8Tkq6I+9hyQOtIw2jmW9z
	 89Qbg43mRaA+X6wcOpW658M8+J4m/hFW7zy4EnoyzpyScK/QGKQomnqHMQLsIl+TDs
	 8EsTvSZMHzkfIDD9SXPyT1Y70+tmDBz2c/9XegZ8FeTFwMVGZARHXr5EQiubcz4RS4
	 AeMfe3PLzY3DkaziQqtI1moqBQRBb8ayzVXA4Md4cNK/tJ6xvyoZE2dNMJLEDfqW54
	 z3ZIDBaINCnxg==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: francesco@valla.it
Cc: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chrispine Tinega <dev@chrispinetinega.com>
Subject: Re: [PATCH 2/2] remoteproc: k3-m4: Leave crash recovery enabled
Date: Mon, 16 Nov 2026 21:49:43 +0300
Message-ID: <20261116184943.1900328-1-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avodrGAJY6tZtrpP@bywater>
References: <20261109054830.42715-1-dev@chrispinetinega.com> <20261109054830.42715-3-dev@chrispinetinega.com> <avodrGAJY6tZtrpP@bywater>
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

On Sun, Nov 15, 2026 at 10:04:00PM +0100, Francesco Valla wrote:
> This can be fine for a core started by Linux, but it's not for a core
> working in IPC-only mode, where Linux only attaches. In that case, a
> recovery action might start a firware living on the Linux userspace that
> is different from the one originally started outside of it (and if this
> is enabled by default, the user might not even notice this).

You are right. In v2, which I have just sent, recovery is enabled only
when Linux booted the M4F. In IPC-only mode the driver keeps it
disabled, so a crash there moves the core to "crashed" and nothing is
loaded in its place. A user who knows the firmware matches can still
turn recovery on through /sys/class/remoteproc/remoteprocN/recovery.

Thanks,
Chrispine
