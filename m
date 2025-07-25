Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C719A18991C;
	Fri, 25 Jul 2025 15:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753456041; cv=none; b=Ke2Lxbvc37GEJ77jaiGMXZttBqXyop7G5NbG7LV2bFx3luumdxrsrj9ZJke8YXYOu25DLkpcIRrof6QBV5fJjoW/WTj9iOKJLMy85jWrdh7t77u4PwhWUIBKLYWuT4P+3OCvnNbLGloJi6sLUbQfS7iloW5agxuMchxjWKesh1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753456041; c=relaxed/simple;
	bh=TVc4c4n5XswwFHAXB4YLfPag9XQKK6X5rm69nPh63I8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nEd2r2S8F48xs75zZWHPKyDR8bpFO8nXyv1GZcC+Dn22fBKi3p0R9/icecZNWbn5d+MHdPKFzRKTOofYY2X0QfGxciGVr0eZMrHBKIA5JoEh9Mbx6uhuVeTZTLm9d+o/yf8crLLxJ+uMuLIrgakthesavp7kfSrkigHqVorOTJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8lqdrPn; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8lqdrPn"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-749248d06faso2002486b3a.2;
        Fri, 25 Jul 2025 08:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753456039; x=1754060839; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GYfDRgw7sEYugLsg5YTlXCmEjHaYQEe19wJispc5WtA=;
        b=Z8lqdrPntSh2DByCbJErEMrIT4I0JQCkDhn64uHR/I+614NDRnKc4wlk5ru8R9roqm
         Gm5xpRZRnrs72vnXHcGYk0aCJu7d2CSi6CsRMmjjDhhXgOPXWjKlbbAeYnNC/dkEUpXv
         FLtorSs8qZyP4+y4CgbI7uwfAIPu1Mk43odoB78plMz09yuPMNfIUp6gHy6y5blljb/y
         gVt30LZD7NcT9Dm0Zq8YCAELAVdqEo/wJOOtQAMef9a/JbXux9/c9Rm9vYkUsy5QMZth
         JHmeYNJTuF/ZIIQWMdcguSMEY6ExUtxJKfMZKTD5rlXHTakz/xUXw2ov8vm8YHoJIzln
         vWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753456039; x=1754060839;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GYfDRgw7sEYugLsg5YTlXCmEjHaYQEe19wJispc5WtA=;
        b=hDTJMCOGv7Mm/e6cHAYagSAg6gojTzx3BTse/4ZoEP/4SPMwY3e2E1pRmmb8+SWjur
         E0Wy7z8WJ2OBncHz8/qUIhB8cOmb0ys3/0G+85K3wclmb037isX/soBonyDiCjRGxAUP
         JsA/yP6OT7gCa1IRF5JokObHs+NhzrabOrJRZ8q1pUiduigb+UmsoTDk4sjyhIXpNUNE
         ewsl/MCzWczHbRanQo+ICldTwsZEcO4x8hKJaDVWiJW9cckD+khubEuCmwvQr6W2eZuv
         BjMLfPc+l7PAF/8bEYVrq53ma0yKi7bHacqpJdoIb+5vBIL1N5jkjOeQujzFUneR4ETy
         bKoA==
X-Forwarded-Encrypted: i=1; AJvYcCWtGN87c/capLd1wbNh/a9kwXfT2DCtDWDWDeV0t9LUncIy6K8SZirMizrolTQ4Qg/W4WvkmQKxrXsLdL8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/vOt7s+O9fxBFJ54OZFQ3mU/VlN3QNjemBJKYQ16jFBGHoDAu
	R+4fWyX2EknxoqTLkwLIsGfEJDcRcizqSR4wdzVo9KBYsmw5hwlyGiQBj8Wr+w==
X-Gm-Gg: ASbGncstm8y13Bt9Qd5/fsuFUFtjM+gl+XVQPFS+U61PVfsnsUWKuAAEBUD4vTehIJt
	FlW0do++jGAkEmRvL/2BcNbDgPuHKBybEhq5DZ0sRTjQcOS0+sGMT/sXmlUuRZoFALQ55JZffOJ
	fplBGj5qm8iswfpYmiX2vazEXHT8pCZvgoN9rDcmKgMIysrNwZDCMp/vzzvaJIEDY/CHwUGXMrT
	pvC4DqjwoC/X8o6hYUexqjqU4s6HD8sigrOZnCD8r9QtUdYDS93CLRF3vzeD+Q+FBCl+BZeUcG8
	kAEBrf1eGjr81G367kxLIZIyb+FhC5DwGqpMsmOguOCCvYmsTOYdvEBNiVKLkqlrf+nnNr7Utz7
	3kewUbDDdo5NDE8mRrNSK
X-Google-Smtp-Source: AGHT+IEtT+8mPPG71q8ntm/07DZ9mO25bz4MKWLmGEROingYExB4ZRov26BTa3buTb80X6t3sIdP2w==
X-Received: by 2002:a17:90b:2e0e:b0:311:f05b:86a5 with SMTP id 98e67ed59e1d1-31e776207cfmr3892643a91.0.1753456038425;
        Fri, 25 Jul 2025 08:07:18 -0700 (PDT)
Received: from hiagonb ([2804:1b3:a7c1:ed11:1206:361d:4c46:cefb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e75753d1asm1623317a91.40.2025.07.25.08.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 08:07:17 -0700 (PDT)
Date: Fri, 25 Jul 2025 12:07:13 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: linux-remoteproc@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: System can not go into suspend when remoteproc is probed on AM62X
Message-ID: <20250725150713.barg5lhqr4reoxv3@hiagonb>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello everyone,

I noticed something that I am trying to debug, maybe you have any idea
or tips to help me debugging this issue.

On AM62 and AM62P SoCs that I tested, when the remote proc driver is
probed, suspend to RAM mode does not work anymore. Without the
remote proc driver enabled, everything works just fine.

See the driver being probed with AM62 and Cortex M4:

root@verdin-am62-15479173:~# dmesg | grep -i -E "remoteproc|rproc|omap-mailbox"
[   10.321304] omap-mailbox 29000000.mailbox: omap mailbox rev 0x66fc9100
[   10.518369] k3-m4-rproc 5000000.m4fss: assigned reserved memory node m4f-dma-memory@9cb00000
[   10.560055] k3-m4-rproc 5000000.m4fss: configured M4F for remoteproc mode
[   10.600283] remoteproc remoteproc0: 5000000.m4fss is available
[   10.615269] remoteproc remoteproc0: Direct firmware load for am62-mcu-m4f0_0-fw failed with error -2
[   10.650058] remoteproc remoteproc0: powering up 5000000.m4fss
[   10.677073] remoteproc remoteproc0: Direct firmware load for am62-mcu-m4f0_0-fw failed with error -2
[   10.696173] remoteproc remoteproc0: request_firmware failed: -2
[   11.953278] remoteproc remoteproc1: 30074000.pru is available
[   11.985475] remoteproc remoteproc2: 30078000.pru is available

And then when trying to to go into suspend:

root@verdin-am62-15479173:~# echo mem > /sys/power/state
[   41.727649] PM: suspend entry (deep)
[   41.738557] Filesystems sync: 0.006 seconds
[   41.751535] Freezing user space processes
[   41.758692] Freezing user space processes completed (elapsed 0.002 seconds)
[   41.765763] OOM killer disabled.
[   41.768999] Freezing remaining freezable tasks
[   41.774858] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[   41.782333] printk: Suspending console(s) (use no_console_suspend to debug)
[   41.830945] omap-mailbox 29000000.mailbox: fifo 1 has unexpected unread messages
[   41.830980] omap-mailbox 29000000.mailbox: PM: dpm_run_callback(): platform_pm_suspend returns -16
[   41.831013] omap-mailbox 29000000.mailbox: PM: failed to suspend: error -16
[   41.831040] PM: Some devices failed to suspend, or early wake event detected
[   41.851206] am65-cpsw-nuss 8000000.ethernet: set new flow-id-base 19
[   41.861919] am65-cpsw-nuss 8000000.ethernet end0: PHY [8000f00.mdio:00] driver [TI DP83867] (irq=354)
[   41.862921] am65-cpsw-nuss 8000000.ethernet end0: configuring for phy/rgmii-rxid link mode
[   41.868493] usb-conn-gpio connector: repeated role: device
[   42.012894] OOM killer enabled.
[   42.016050] Restarting tasks: Starting
[   42.024121] Restarting tasks: Done
[   42.033660] random: crng reseeded on system resumption
[   42.040482] PM: suspend exit

I believe the issue happens at this line:

[   41.830945] omap-mailbox 29000000.mailbox: fifo 1 has unexpected unread messages

When the remoteproc driver is probed, the omap-mailbox drivers sends a
message to Cortex-M4 which is not consumed. Please notice in this case
there is no firmware running on M4, the driver is only set to "okay"
into the DTB.

See the debug message with the message being sent ("hfranco"):

root@verdin-am62-15479173:~# dmesg | grep -i -E "remoteproc|rproc|omap-mailbox|hfranco"
[   10.321304] omap-mailbox 29000000.mailbox: omap mailbox rev 0x66fc9100
[   10.518369] k3-m4-rproc 5000000.m4fss: assigned reserved memory node m4f-dma-memory@9cb00000
[   10.560055] k3-m4-rproc 5000000.m4fss: configured M4F for remoteproc mode
[   10.577664] hfranco: sending msg 0xffffff03, name mbox-m4-0
[   10.600283] remoteproc remoteproc0: 5000000.m4fss is available
[   10.615269] remoteproc remoteproc0: Direct firmware load for am62-mcu-m4f0_0-fw failed with error -2
[   10.650058] remoteproc remoteproc0: powering up 5000000.m4fss
[   10.677073] remoteproc remoteproc0: Direct firmware load for am62-mcu-m4f0_0-fw failed with error -2
[   10.696173] remoteproc remoteproc0: request_firmware failed: -2
[   11.953278] remoteproc remoteproc1: 30074000.pru is available
[   11.985475] remoteproc remoteproc2: 30078000.pru is available

AFAIK, the message in sent when 'send_data' callback is called inside
mailbox.c, which triggers omap_mbox_chan_send_data() from
omap-mailbox.c. If I skip this message, suspend to RAM works again, as
the mailbox will be empty.

Do you know why this message needs to be sent? Is there a way we can
overcome this issue? Commit 9f0cee984a25 ("mailbox/omap: check for any
unread messages during suspend") introduced this check.

I will be happy to send patches to address this issue.

Thanks!

Hiago.
