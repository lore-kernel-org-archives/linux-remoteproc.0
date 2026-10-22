Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695781;
	b=lpw/lLd0fZRTWPjFuCk75iii5GS9AWYcGaLxe7KyjY/ejbFKS/NLzbUMygyLV4kj5nM5
	 HR88YGvs5YS7/+1si9kyZwt6Ym72xB7WPyiYcKjO4a9SkdzFQgiHKC0zAsLz7KUi7kCjI
	 PEVXpkYLzlKJQ4ktbSdAFav2IAmGTTI3TCe1RVFhJ2899Atn/sUs2tmj+lbFGgFKUWS4I
	 YxKOYEm/q8JsOiNRsDPDmg2W0weLmo1cimX+ZJjFNp7IDFe0AERGjnFwbjZArBzJP29Es
	 6VI/m9HRJxwvXzVG20OwioVxpdZexi7JUoJTxjfULg1Q78doOawatuX7rjVGLJCmNsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7dOAuB9XyFaeFfFVegEDpoF2gtsk0VyOm+nWLSWg1aM=;
	b=0142Tavoqhwc38kpOxqBiAcB2DZxgH7G5SRqSssXKJ4d/48cb79mR1du/3icSzm1BLZc
	 3L9kOrTNieRWf13axx8gizghKkZZalXNvAxRRNTMEAokV1X+e7Kp1OEwwa9TC6MT4+Lhw
	 ofKkCEeKnS1HBfgDmKF7Ah5mJncG0ia+typRR9fEl45xwBI7RgnI0kRXhGiLS4FH/kdAz
	 lYXldKAXzaohwsjsT+uEu1fd4hlveEKWtx1M18M2sfsv4YGVueEZzdAxls1a7fhWHMwkT
	 ZJGtHFalXdg/uUajpWAvyPXmuBtez4Mc2KqSqOJgaiWAO+aR65SqpFYCDD5QiMKdMJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pOy4fl+G;
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D6D606A31B
	for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 19:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1D6D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pOy4fl+G
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3a65ed9c7cfso295411fa.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 22 Oct 2026 12:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695779; x=1793300579; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7dOAuB9XyFaeFfFVegEDpoF2gtsk0VyOm+nWLSWg1aM=;
        b=pOy4fl+GwyLeJIvuh+b19PgJ+11CKlDAZMUngTCak1eNqiD73w1IUxrzXw2NJ7ktR7
         kGzyAxFJqunyhejXwZj5yQlrPtDWBJTy6CpcnfbAyitA/tzFD0UzbDVXUxFNg56SXlbY
         S6adHHOhX9jTxjU0lBpDW83y9fMcU/ciKxYbx+YA7MqVSME17adBXo0ajDmtJFSke72W
         jaxQNnYE/CnPJzdh2NZZGkj19qkG+CrzCbjZyEdzbm6qumi9EMyv9p/0spzpFrxj+4/x
         AhjG2bB511fctWPNUaoZEFx77SOXnie3yF8L+xsdf+MzxgKbY8bazpDXmzqRB6s8e5xC
         XUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695779; x=1793300579;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dOAuB9XyFaeFfFVegEDpoF2gtsk0VyOm+nWLSWg1aM=;
        b=v03ET8DVz96gWLERptaFB+s/GFYORTbDod4au4OxBCL1Zu59nQnkqcwbQcNQOCD63I
         WTD2W3VEIxaAszxCbR2jJbfc9MouE6aVF1crfNLFXVMrVyf+BBo81lueFQfejxlymT1x
         RKyhoOkYKn3mEMtW2FStzJTN9SMuvVu4a7PHZ0leG/zCd92fH6J5gzY8iFugAaGqhYKv
         a1QMtU4TdeDMa+Ot8r7Fqaf+oB6x/K5FoqAZeRNbRUddgG78BRFueiHjjRKgN7+njTGJ
         BvXkPDL1s7HM433kT1A6lqPpYONkKY8p0YK/A+NOfV8I1EDV72c6ZbLOYs9dNvgNCl5K
         mZ6A==
X-Forwarded-Encrypted: i=1; AKwUvBwHvcgpTPDOZzJI/l1sgtyKK1ATlwBXgegkxNaZrribAD9E5BKkbHWqT53tMnL7jQJ3DL8p5AYSCU+v69RogpMc@vger.kernel.org
X-Gm-Message-State: AFq9FYI2DZD8Hcd0q/1Ms9oWWVR4lpu60m95X1bNB4sBkCwuPLXfhPZW
	D8g7U+JUqKzK1jWlVmz4XLxeQEntZYMIJQfLdZymIEZA6xBSQa/9UJ/3MFDQNT4L
X-Gm-Gg: AYBFou3+sxz7q4C4YjYRqNCF/eXhW+5W6fIufb1ogvAoe5nTc6DBUYkpFBc/L79SWVk
	nMP2EhFR0lD0gG5VgkLqOC5Tq66RgaQMOZ4F+/fzVpTNlRkL34EK5hJOP2XYVrzbG8/WWW2CFie
	ovp3E9pykPNQ5vpNWCkoaK2oqCiPw33LjWoFn7AhcBIvLFfs+nmJ5pun3YOELRikD8k9B2oLAu3
	Im9etIQipljCGznZBAVXbztKIOCTXnt89feXFzb+Su5LhSkoTPOJWBtWM1MIbSn1ODr3QlJMlYH
	JMfh6l0NHX6BaPaJ3GAibTJY4hQPk0WpeMlFFbbWOc3fhAe3F3YuNPXEs8mJJGbS3W+NLlZzyrI
	7dvvdXDvXzrO4n/mYMB8P81xvGIBTmRc1EEpy0k0bcAVFsn/CcjIi+SxsfmGmCQGPWXwrHcjz07
	c2XcPKQrLmQnragSaKGJ4Y8KMojv3bdELXJVWmbpTYQ8ad8Itre5o8Lczejw1g0wWEOn1Iw6tR4
	j9u9MfqP7zlTdBckSx6kbNltGYO4V5JbBJ3e3zDWt+nTZ4wzDqT5tfO1p/lvzKmszLCDH/seBw/
	znBsB9o33NXz5VNLaAgOvVY3U6QjLEHdU/at21s=
X-Received: by 2002:a2e:a54c:0:b0:3ab:28cd:f612 with SMTP id 38308e7fff4ca-3ac4409fd78mr17450261fa.1.1792695778803;
        Thu, 22 Oct 2026 12:02:58 -0700 (PDT)
Received: from ik5070.localdomain (82-131-69-225.ip.elisa.ee. [82.131.69.225])
        by smtp.googlemail.com with ESMTPSA id 38308e7fff4ca-3ac65cff1e0sm99901fa.20.2026.10.22.12.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 12:02:58 -0700 (PDT)
From: Indrek Kruusa <indrek.kruusa@gmail.com>
To: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-remoteproc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Indrek Kruusa <indrek.kruusa@gmail.com>
Subject: Re: [PATCH 0/3] hwspinlock: sun6i: Allwinner D1 and T113 support
Date: Thu, 22 Oct 2026 22:01:15 +0300
Message-ID: <20261022190203.1998156-1-indrek.kruusa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
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

Hi,

I managed to run this patch series on a Sipeed Lichee RV Dock (Allwinner D1),
in this setup:

  - FreeRTOS on the HiFi4 DSP, running a task that contends for the lock
  - a test kernel module touching the same shared memory, with and without
    taking the lock

The series is applied on top of v7.3-rc7.

What I ran:

  - probe: 3005000.hwlock binds and the driver reports 32 locks

  - mutual exclusion: lock 0, taken alternately by the C906 and the HiFi4.
    Each side added 1 to a shared counter under the lock, 1,000,000 times:

      counter=2000000 expected=2000000 -> EXACT
      tripwire linux=0 dsp=0 -> no overlap

    A tripwire field is set while inside the critical section and read by the
    other side, so overlap is caught independently of the counter.

  - negative control, identical loop with the lock not taken:

      counter=1885761 expected=2000000 -> LOST UPDATES   (5.7% lost)
      tripwire linux=100302 dsp=674915 -> OVERLAP DETECTED

The loss rate in the negative control varies between runs (5-19% observed);
the log linked below is one sample.

Tested-by: Indrek Kruusa <indrek.kruusa@gmail.com>

I put this test setup together with AI assistance. Sources, build
instructions, ready-to-use images (DSP firmware included) for the RV Dock
and for the Nezha (untested), and the captured console logs are here:

  https://github.com/ikruusa/d1-hwspinlock-test

Greetings,
Indrek
