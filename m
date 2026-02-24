Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F5D226CFE
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Feb 2026 00:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771893330; cv=pass; b=KHQtgrmK0rWAl6wLfdOn5pxLaehHERmyr9Ci4+TkbLUOxG3WyIFa9w20uu08EMlqHqDuWY7/etBk0ZHyX/WEicrbRtdmcwr5TxkliDY2gZ43DFSXwbIpSpw9mG5HfAlg2CVhXiF5GaXHSAuV1TWkhdCNYD9l3CSpIXuGgTa4pEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771893330; c=relaxed/simple;
	bh=fSM5nA8AYKAJ40CR9NTEbBLXLnVPmpF/rnnsRsV9NgE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IFu98s4zsFhQS/vP0La5Bbw9kvz6jf6NgyXFKHA5MtHjX5gwdagznZUe7e1JL+vGuPTm2HOpxQJ7chlCrkJYYUivW1fktSknKvuq6zDm58gQ8AlKcBVB0JuAFnRZAD1O8SX943j0PSsyyd4E0ALo4SHc2ZlAcMssAHLERmcJAqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FY+GVgxy; arc=pass smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FY+GVgxy"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45f171cb842so3645844b6e.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Feb 2026 16:35:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771893328; cv=none;
        d=google.com; s=arc-20240605;
        b=Nvp+5KBujmcy4bGn0jnnm4xkv1Y+5HYX3RkOYDzwkQLgxHE6e5KIazUoUquOcuXee5
         e/GIPZFzag0DiunOCnLeZuW4PdC/VA0N71O9p/cBTeJ/OzKnUnMqbmi4v7+aqeDHA0S/
         6KhdjJjJhUh854m+HRSv0Md+UQaxZxMpfL7+cqSKo2xByEdsrIIXsMca9rD/CjAwHN3R
         /cd7kVbnq37g39OOoTIx87qF5AT4Lab4aI4aSVKwaXp1YCjQeMgDeX2IICvezJCP64mB
         sSdC0vflcugDlGvB85jRcdcTK7bLQKKXRWO9RqYKDIUqxP9Q1oO3eLqveshR5zexBVWK
         e2Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fSM5nA8AYKAJ40CR9NTEbBLXLnVPmpF/rnnsRsV9NgE=;
        fh=TxmcSjuWVawf5yqn/8oZCBMPr0ITEp4tPf7RYJUSWng=;
        b=ANql3GnG7okGJ3T2wzEZncpc7mq0biNFdYxuQ3xeZW/Bs+DFxuiG1zTwLDngCo3/PY
         5JusLJQIfihNES5lw+FufJx4kbuJ9Lqpdck1YPGXTObCJNnsqKi+j8yhBIvRyL19aT+X
         x+rxCVRa2NsLcf1wromI/lZ0d7tFFbssslAbnR+Rj+BLzPai4RbeiddpqumU8WD0SVlc
         H7hGp/gYm7BGbSq5K6AJsrQj9/RpdKFzTfBUovD4plC0fnTk/rTXWMCpbiO4wLpmJN3g
         xXXIEe+AhiXA+RxYEw7wfcDfah6AjF5CN2kcXKOC+M1JuNPZF7ujCAUQiZ68mCSyUHrC
         Qjfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771893328; x=1772498128; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fSM5nA8AYKAJ40CR9NTEbBLXLnVPmpF/rnnsRsV9NgE=;
        b=FY+GVgxylNX3rVFi0mR0UHORXhyjqS1cWGHlSzOouJDr1WPAo6pdPT9CyR2ozrtUMd
         TNcZtCVaW3+SSiZevq6ny4K2AAZxsHLeLt4/ecDfH4zvvklrN2zehN0WUGGCYtAINKvO
         Yfy2LMwdXCqwjwT6e05r5PN12dWw6dCJymki8Xv+JUEtYxdU1DkeUlkmzdAORvZdByz/
         YxX8ktx+Ub/fTG10eIIT5MOoQ0EfALUPD9voqTwUHgKgqQVL3hDJVosAJp9q2vOklKRF
         bPTAZagV4NlNdn6VOpvYbg2CRHGX0EmBXtNMNbswVVa5fW/j8lnUgEyBH6v7cLQJKgvs
         QzXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771893328; x=1772498128;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fSM5nA8AYKAJ40CR9NTEbBLXLnVPmpF/rnnsRsV9NgE=;
        b=MiEkPCC4aSNg/xF/OO8GhBOthJaDGRXHryt6IeTy0d22qJHzkbFTetLXZqn35IHfAr
         7ucFgLhIh2ZlP1vRuBhd/urvGGaO5v/i16AKArUBon4ZSj2B0J7S+dFfyjmE+gAK81ec
         170n4tJq8PDh3Omh6phwenNJKQEGeh88IdDTrSk2JoTH26tMnEAOz3TKctfCdDWMOeO9
         O0q6k4aQhq3x49Xa4vzz3mOqE+MF4UbuJ8vh0shJ0FEJKbafEUpBiinjH8nOClmnnaaH
         5yc7msjyPrbPRvdcNNZhfFBOZ8WibOAW8LIW7RD0NrOa/OL3s3jAlNiy4b+o+InTmKH7
         jI6g==
X-Forwarded-Encrypted: i=1; AJvYcCXsaYtTtoSnySDaLkDfswceTLIQrC1e7z6+c5XIojXwPlmoeGnJN87CVIeLbEtXC+Z0PXxV6ps+BpVqoscgxzJK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/6ClPB21hI4BfFByOBfHg7/3EOpdKqCvX0r4dPPnzzpOKYLoi
	2YegphHATyuAgt2ADy9EmRHcoCbXmsKg8l5aAO5SR/x8oe2HEPWMpG8mYN6zpg/hroR1owsGI/K
	jutgYOQlFvY1m/ExeyXFXiAYhKySRFTU=
X-Gm-Gg: AZuq6aIoX+Oe+OOkP3dBL3jyWT7pPnUiXq9I84ywQNnBIZKSkriLTQdKGt+ptqNWV3M
	cHSQKYF2XoBfu4vO15OXiQ6/xeJ8iJYzlj38np6xOjrznD/p0yRjsDiSRpY8WPOZ51H1mxxp769
	qiljHI9mLTY+/Q/h2U1JcsQeqUBeqsNgvTLWkyMFivtlxyILRZZABb9tRkgEx0Jhefy7eBWqeDi
	Y8PUwA6J5mUrE9k3VvNlvjojBuIPkJyNywzIMqRhlbpzSmEbLGhVyqorGhVZVYD8l/koZCxPqAs
	Jt+i3IdN
X-Received: by 2002:a05:6808:171c:b0:455:eba2:9efa with SMTP id
 5614622812f47-46446ff27e1mr4546417b6e.4.1771893327712; Mon, 23 Feb 2026
 16:35:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260209234430.512492-1-jassisinghbrar@gmail.com> <jo4kugxook5b6fl7ifh3nuznehotkyqwnrgwq3olank7cvzhmj@hj5ibm3bbsln>
In-Reply-To: <jo4kugxook5b6fl7ifh3nuznehotkyqwnrgwq3olank7cvzhmj@hj5ibm3bbsln>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 23 Feb 2026 18:35:16 -0600
X-Gm-Features: AaiRm5162Iga0HE8y2jyf51WHo2pGbevOhu7bfrszikh909FGHI3M2c5jKdcWRk
Message-ID: <CABb+yY2vzczJ8ODc22P4hCDn1=epki9aXgJCySumeADBuHgaKg@mail.gmail.com>
Subject: Re: [PATCH] mailbox: add API to query available TX queue slots
To: Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	tanmay.shah@amd.com, mathieu.poirier@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 23, 2026 at 9:29=E2=80=AFAM Bjorn Andersson <andersson@kernel.o=
rg> wrote:
>
> On Mon, Feb 09, 2026 at 05:44:30PM -0600, jassisinghbrar@gmail.com wrote:
> > From: Jassi Brar <jassisinghbrar@gmail.com>
> >
> > Clients sometimes need to know whether the mailbox TX queue has room
> > before posting a new message.
>
> This is rather vague, could you be more specific?
>
> > Rather than exposing internal queue state
> > through a struct field, provide a proper accessor function that returns
> > the number of available slots for a given channel.
> >
> > This lets clients choose to back off when the queue is full instead of
> > hitting the -ENOBUFS error path and the misleading "Try increasing
> > MBOX_TX_QUEUE_LEN" warning.
> >
>
> In the event that we're using the mailbox framework as a doorbell, I
> presume that the queue is full of duplicate rings already - so backing
> off it perfectly fine.
>
> But in the case where the client actually uses the interface to convey
> data, what is the expected way for the client to know when to make
> another attempt?
>
Whatever the client is currently using. It just backs off for another
such signal when mbox_chan_tx_slots_available() returns 0.
If a client submits periodically, it will back off for another period.
If a client submits upon receiving ack packet for last submission, it
will back off until it gets another ack packet.

Cheers!
Jassi
