Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF431C760D;
	Wed, 19 Feb 2025 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739956259; cv=none; b=MPlufsI565sL5TFhjUA9PePb2CWum1+UxqCiOk+NQP9VzOx5GIkWbGMVQSiK/dK7V5N6+7ZSgnaT0Yxr4o1q3iAu3d0nJS5dVCA0ee7pRQ4cMpZ4LJk5uBa1GPKNbE86isYqKN6wrG6n6Sku8whk19Gld+4Qnz7Nv0VMlf6k0Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739956259; c=relaxed/simple;
	bh=Mfnk4+yY355XVH6CmnFX3sLcgDhvDA98IzA+BQ+5SJo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dP1YXES3c1WoRkim9sbh+Qn/qqFAT34lemXRkP9x0dbaRsp4S4iqqrMf/rzyQeT2BlZ4Y6AM7jRjaivk67BObOHeKOA7DryedpfQ7tU4kOsrBa3yDL14iD29xrVIsn73Q0giAw0GyCCR/nX0YxXItAYZ1t+sHXtHPxbdQSrUZDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=EtMb9zkJ; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="EtMb9zkJ"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51J9AlWm235735
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 19 Feb 2025 03:10:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1739956247;
	bh=gJPqdtzI9Py6Q4HPT5VLP7yvXmMDLZ9+w6vjEknP6v0=;
	h=From:To:CC:Subject:Date;
	b=EtMb9zkJi/DvzW2PVwpaX81NKX6xOP0cD7ypus8eyNjqp1uzGGTSd8TDOEika37Bo
	 uYlxVObAZ8iY5IGy0QsfHPabPXrXTJZxZjoIDQl+w1pmi7ZcYxiGrP/EjFb16KNKW6
	 H+FVL0e/KLGXDb1lcUsyOy9CaMvJIfxcjF5QRXwA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51J9AlHo079355;
	Wed, 19 Feb 2025 03:10:47 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Feb 2025 03:10:47 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Feb 2025 03:10:47 -0600
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51J9AhoH053377;
	Wed, 19 Feb 2025 03:10:43 -0600
From: Beleswar Padhi <b-padhi@ti.com>
To: <andersson@kernel.org>, <mathieu.poirier@linaro.org>
CC: <afd@ti.com>, <hnagalla@ti.com>, <u-kumar1@ti.com>, <jm@ti.com>,
        <jan.kiszka@siemens.com>, <christophe.jaillet@wanadoo.fr>,
        <jkangas@redhat.com>, <eballetbo@redhat.com>, <b-padhi@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/2] Refactor Data Structures for TI K3 R5 remoteproc
Date: Wed, 19 Feb 2025 14:40:40 +0530
Message-ID: <20250219091042.263819-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

This series aligns the K3 R5 remoteproc's data structures with that of M4 and
DSP data structures, so that common functionalities between R5, DSP, M4 can be
refactored out later[0]. Thanks to Andrew for suggesting this idea[1], however I
have tweaked the implementation a bit, reasoning in Appendix.

Testing Done:
1. Tested boot of R5F remoteprocs in MCU and MAIN voltage domain in both
IPC-Only mode and Kernel remoteproc mode in all K3 J7* devices.
2. Tested IPC in Lockstep, Split and Single-CPU Mode configuration (wherever
applicable) of R5F remoteprocs in all K3 J7* devices.
3. Tested shutdown and power-up of R5F remoteprocs from Linux userspace in
Lockstep, Split and Single-CPU Mode configuration. (with additional patches for
graceful shutdown)
4. Verified no errors in device removal path by executing
`modprobe -r ti_k3_r5_remoteproc`
5. Tested that each patch in this series generates no new warnings/errors.

Note:
Could not test the Single-core mode configuration for R5F cluster, as J7*
devices do not have them.

[0]: https://lore.kernel.org/all/20250103101231.1508151-1-b-padhi@ti.com
[1]: https://lore.kernel.org/all/da80e039-bcea-41a3-83ec-e10ffb4b0c46@ti.com

Thanks,
Beleswar

Appendix:
Tried with both approaches suggested in [1]:
a. Two pointers for cores: With this approach, had to write lot of extra code in
error paths, which could be done easier with a loop. Sample code snippet: 
https://gist.github.com/3V3RYONE/8ee52c38a2411a0a5d31217781f1dc56

b. Array of two pointers: Got better with looping around cores, but still had to
check for out of bound edge cases etc, Plus had to loop at all error paths,
lengthier code.

c. Current Implementation: So, if we are already looping, why not use a list
instead of array, and let the list_* helpers take care of traversal etc. With
this, I had to do the least changes, plus we need not merge the two structs now,
thanks to void pointers. I think this was the thought when we first wrote the
driver (using list instead of arrays). Let me know if there is any drawbacks.

Beleswar Padhi (2):
  remoteproc: k3-r5: Re-order internal memory initialization function
  remoteproc: k3-r5: Refactor Data Structures to Align with DSP and M4

 drivers/remoteproc/ti_k3_r5_remoteproc.c | 510 ++++++++++++-----------
 1 file changed, 262 insertions(+), 248 deletions(-)

-- 
2.34.1

