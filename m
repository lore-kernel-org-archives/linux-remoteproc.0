Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=63.250.43.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031083;
	b=lRI7ikSgBPoaSIrrQVjjwa8vo0pFbn5x5ZajNVYaTWXHgLMosuBhySNs/0/eT8OQqzZV
	 0MsprkZ8HzqBSD0SrtUsU/KMfPLiR223hGWfvaAgAB9XE+g1RM7xyXW70X74PbIGiV1qj
	 R1uyGE4NwYfzCJoP3xh+6q3jT0cWnpqNbJTexiewhsKblShYKxQsBh+oqEF6ZP+rr0IgH
	 Tm9ypmQ+K532aygbEHyZ3BzP0zjsWqqaXO+APbb+JnTYE4V1m6zMlx2LU0rt6qqaZTA/T
	 jncpMXbDjr1C61yw8Kd7+MYOApQNxSGCSSMdrP0LpvnlPlbt9lzfl/Hl+335IGqBjaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031083;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Envelope-From;
	bh=dPq5I2kWqkyVKQOoqhjq3o0Q9Q3aeu5CCOQhhDDWVWk=;
	b=WN/He7X07qkohol8HbY4R6xoF/eWoCCDLCqylog5HF64xYtV/ncdvCrnB1AmVIKc8WLc
	 QEg17qSgcRpiiCsVswQUKSrA2DbMo3AAPJ5rXSSNr9xkknNi5wyJchQmxfSIzL6ic4/JY
	 xd6VGa7pK2BrEaEE+wqh5Q0IN373xLW59v6jm4Op/CHOgYXECKZQo7cbblWcOxEOHM9wg
	 2CulE6c9G14r+4346+wyJyXOyAzd9DNUJl/Yj31UBXqSYpJoO8X+84VLYOsM3URzUaBYo
	 haJcnoFsb8011FZ02NzuWXg5n4Ip41L0Tz/IZVd7LNFXSYMu2lbFSTqtjzGO9zd++uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrispinetinega.com;
	spf=pass smtp.mailfrom=chrispinetinega.com;
	dkim=pass header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=xFvfE7dV;
	arc=none smtp.remote-ip=63.250.43.81
Received: from out-2uec-a81.jellyfish.systems (out-2uec-a81.jellyfish.systems [63.250.43.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CA6606A320
	for <linux-remoteproc@vger.kernel.org>; Wed, 18 Nov 2026 19:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66CA6606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrispinetinega.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chrispinetinega.com header.i=@chrispinetinega.com header.a=rsa-sha256 header.s=default header.b=xFvfE7dV
Received: from mail.privateemail.com (unknown [62.8.90.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.privateemail.com (Postfix) with ESMTPSA id 4jVBr82YC7z2x9H;
	Wed, 18 Nov 2026 19:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chrispinetinega.com;
	s=default; t=1795031068;
	bh=dPq5I2kWqkyVKQOoqhjq3o0Q9Q3aeu5CCOQhhDDWVWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xFvfE7dVwhqbLZyqvCErJq469wrtZKJoayb+anUCJRRFXFHGwt0rQXX5WRwtQY83e
	 8mcpWj8kH0clfDW6CO0RBoGAbke1kyjf66RrRI48jLqEHnktbNgrNir95MWDxmxi4t
	 ewqGm/Wi9geswwLWEjBeMic2Xi7zSSr0iKw/mfsVkFum39Ey7uYis0Cyw+233MVU0F
	 ZAUGMH8FbTCu3rXv3c+H/6d6Ot4dK4zTQayk+wUg/0CluEtXRRzRs/kgjrdJDBvun0
	 TyYpQXb7PiPxDz8pIR9WfP4laJmawjjzZm05pnGtFclzL1UBu/a8wR3Cn8XiFUljnT
	 tTbjYyuXw3LzA==
From: Chrispine Tinega <dev@chrispinetinega.com>
To: Francesco Valla <francesco@valla.it>
Cc: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] remoteproc: k3: Report a remote crash to the remoteproc core
Date: Wed, 18 Nov 2026 22:44:03 +0300
Message-ID: <20261118194415.1757945-1-dev@chrispinetinega.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <av3YQ1tKSABEha9o@bywater>
References: <20261116184146.1897281-1-dev@chrispinetinega.com> <20261116184146.1897281-2-dev@chrispinetinega.com> <av3YQ1tKSABEha9o@bywater>
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

On Wed, Nov 18, 2026 at 05:57:10PM +0100, Francesco Valla wrote:
> Did you have the chance to take a look at the review sashiko did?
> I think the points about the leaks in IPC mode make sense and are worth
> an investigation, both for the M4 and R5F cases.

I had not, thanks. Both of its points on patch 1 hold, and they have
one cause: v2 reports a crash for a core that Linux did not boot.

1. IPC-only mode. Once a DETACHED or ATTACHED core is RPROC_CRASHED,
   rproc_detach() refuses it with -EINVAL. The DSP and R5F remove paths
   only detach an RPROC_ATTACHED core, so they skip it and leak its
   carveouts and subdevices. The R5F also has no start or stop ops in
   this mode. On the M4F and DSP, a shutdown would reset a core that
   Linux never started.

2. Probe. All three drivers request the mailbox before
   devm_rproc_add(), so a crash queued during probe is never cancelled
   if probe then fails. In IPC-only mode the crash work can itself
   cause the failure, by setting RPROC_CRASHED before rproc_validate()
   runs. A crash the core sent before Linux probed is enough, since it
   waits in the mailbox until the channel is opened.

For v3 I report the crash only when the core is RPROC_RUNNING, and keep
the log line otherwise:

	case RP_MBOX_CRASH:
		if (rproc->state == RPROC_RUNNING)
			rproc_report_crash(rproc, RPROC_FATAL_ERROR);
		else
			dev_err(dev, "K3 rproc %s crashed\n", rproc->name);
		break;

An IPC-only core is never RPROC_RUNNING, and no core is before
devm_rproc_add(). A core that Linux booted takes the same path as in
v2, so your stress test still covers it. Patch 2 is unchanged.

Recovering an IPC-only core needs the core to handle a crashed attached
core, for instance as RPROC_FEAT_ATTACH_ON_RECOVERY does. I would leave
that for a separate series.

The review also points at an unbalanced put_device() in
k3_rproc_unprepare(). I think that one is older than this series:
stopping an attached M4F or DSP through sysfs reaches it with no crash
at all. I will check it on a board and send it separately.

v3 builds with W=1 and checkpatch is clean. I will post it once your
stress test is done, unless you would rather have it now.

Regards,
Chrispine
