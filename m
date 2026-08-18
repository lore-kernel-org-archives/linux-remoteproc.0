Received: from smtp-190b.mail.infomaniak.ch (smtp-190b.mail.infomaniak.ch [185.125.25.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB77221FB6
	for <linux-remoteproc@vger.kernel.org>; Tue, 18 Aug 2026 14:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787062508; cv=none; b=nx6iJg4kSOs1gKgKuELmflwx3ghjFdHAZNUwq2IvZpSYhDOlqn8H/FZcPDZxtXRJNMp5OQPNzx4AqSHHk4epnFdKenF1mnX3PlVD+d3K4X6qD8hclFYoFpPFRx3nEz19yFn//XuJgf7Cr0P2C0dKdo/6XyAI5RcYZS6ihgPghhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787062508; c=relaxed/simple;
	bh=E02vUtIxVtGgBprT3efbHTZd4SSgMX7E6KNVUOmDUAI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MwwxDBd+mpTk9X7Wa/bvP+qS3S9i2jaQhbDAlijkREbcCS/PBm7TbhBtCJ4S6G5bkFlSQXPSo25LqDsFFemKr/IZiB6d+Vb1qgKZ9JnIdg2MM3Dl/tV5cF8blwpm3NXJreQlVD6qsCiUXf/teRwLdyYICWFDPsyWdHfdB+WbiJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=humanlearning.ch; spf=pass smtp.mailfrom=humanlearning.ch; dkim=pass (2048-bit key) header.d=humanlearning.ch header.i=@humanlearning.ch header.b=XKp2qKJo; arc=none smtp.client-ip=185.125.25.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=humanlearning.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=humanlearning.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=humanlearning.ch header.i=@humanlearning.ch header.b="XKp2qKJo"
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hPWtT32gcz19mT;
	Tue, 18 Aug 2026 16:14:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=humanlearning.ch;
	s=20250828; t=1787062497;
	bh=0sodEiVPUIKveUv59uC88GsmtokX2XDvr12aUHa0t6c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XKp2qKJoM378zYcdQnshZ9oBEixGV3kJ1ufMKfA7I29q+Fq4UTjmdajvdxTEf1idE
	 99CdIICH2AHqjijf/Eh+e339EcsEY+J+MxDnJ4SlVITpxU3hrp7H+4bJkZLYDCFFg9
	 Aoz6lghHziAWTb7Wbk5wRjx+0SgL97tbVqP9XVGOQbiNWs3iOJzQCNqU+TgJnpHCNi
	 Ni0epb7dIchhgNFKBylzxtGsQAd1tOTeqwqaDdjsqI/t9F3bOgnHxE6SjgZuKe7Ipq
	 xqwnn4qKWiNNRwdgbKZtI234tGMxzZ0qYok40E69tPX+y47q5q+lKHhds5SqiBUnUP
	 PTPlnrnDkMj+w==
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4hPWtS6DWvzQQg;
	Tue, 18 Aug 2026 16:14:56 +0200 (CEST)
From: =?UTF-8?q?Fran=C3=A7ois=20Roux?= <info@humanlearning.ch>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-remoteproc@vger.kernel.org
Subject: Re: [BUG] qcom_q6v5_pas: NULL deref in recovery when using attach-only ops (qcom,broken-reset)
Date: Tue, 18 Aug 2026 16:14:56 +0200
Message-ID: <20260818141456.3708-1-info@humanlearning.ch>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <anx6j8UX3BzvZ7JN@linaro.org>
References: 
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Hi Stephan,

Thanks -- and you are right on both counts. Attaching a crashed remoteproc
makes no sense, so my suggested RPROC_FEAT_ATTACH_ON_RECOVERY was the wrong
answer. I also have a correction to make: I wrote that the crash could not be
triggered on demand. That was wrong, debugfs exposes exactly that, and I
should have looked before claiming otherwise.

So I tested your suggestion instead of guessing. Both runs on the same boot,
same trigger, only rproc->recovery_disabled differing.

With recovery_disabled = true
=============================

	# echo disabled > /sys/kernel/debug/remoteproc/remoteproc1/recovery
	# echo 2 > /sys/kernel/debug/remoteproc/remoteproc1/crash

	remoteproc remoteproc1: crash detected in cdsp: type fatal error
	remoteproc remoteproc1: handling crash #1 in cdsp

That is all of it. No recovery attempt, no oops, kernel untainted. The state
goes to "crashed" rather than "offline", which is also more honest: nothing
stopped the DSP, it is simply known to be dead.

Control, recovery re-enabled
============================

	# echo enabled > /sys/kernel/debug/remoteproc/remoteproc1/recovery

	remoteproc remoteproc1: recovering cdsp
	remoteproc remoteproc1: stopped remote processor cdsp
	Unable to handle kernel NULL pointer dereference at virtual address 0
	Internal error: Oops: 0000000086000004 [#1]  SMP
	pc : 0x0
	lr : rproc_start+0xc0/0x164
	Call trace:
	 rproc_trigger_recovery+0x148/0x164
	 rproc_recovery_write+0x16c/0x180

Same fault, same lr, as the spontaneous CDSP crash I reported -- only the
entry point differs, debugfs write instead of rproc_crash_handler_work. The
writing process took a SIGSEGV, since the oops happened in its write() path.

So: recovery_disabled = true fixes it, verified on hardware.

One observation, take it or leave it: rproc_start() calls ops->start without
checking it, and rproc_boot_recovery() does the same for ops->coredump. Even
with the flag set correctly by every driver, an rproc_ops missing .start
remains one debugfs write away from a NULL call. A check there would turn a
driver bug into an error return.

On qcom,broken-reset being controversial and possibly never posted upstream:
understood, and thanks for saying so plainly rather than leaving it implied.
I have written that caveat into my notes next to the workaround, so anyone
picking it up from there knows it is not headed for mainline as it stands.
The machine is a Surface Pro 12in (X1P42100) booted at EL2 via slbounce,
where the DSPs are started by the UEFI driver before ExitBootServices; your
series is what makes audio work there at all, so it has been worth having
even in this state.

Thanks again,
François Roux

--
This reply, and the report before it, were drafted with AI assistance; the
testing and the machine are mine.
