Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504481;
	b=fp0WIScIAOaA+j0DMIMnHOyCDKobOaU9jgCldx/CGR3HNT/YNrvNc8uuMLSnAnfOf7lg
	 9RTkkGnQ6X9gWxGJZlsVxcgGs+rzE5SEmHPzJBU++xVdrLa6thx//U7/uj3NjSOQewBhS
	 GnxNuULP235TgZYbc9SIvG5ckmhBGc3K/PG1tNoUGdNQl00gQvlIHhAPZduNnu4nBmeYv
	 +hbkoRXcOyD/cR2Og+Pn6qJPBtPLsj6EKIPP2cU3I1C5Z1EoyVHSB1SdeVHTQ1LOez4yb
	 TCR5wsF9Rl17DB+UeZlG9N264QOYAqPqLUpI0Y1/X2myn5r2xnSL7TQq2NXRKJJ1siw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wS4At43W7m/1czA+JG8xGkPi12kG50SZ0Tv+e+jtFSI=;
	b=2VWP8kyL/1YP3z76SgvPdnPuYIf9peh2JoEEpDivogI7LZxs5Uvgropv1gM+NBLQChLX
	 TODFfklSs+aSAfot1h8KKmGjhXP0xH6Nr+LjDbckMp+ur/bScv4zVhHy+GbRCtKIYu9Ee
	 cqB1Z6O/Z7xQt3o6+CtIf7k/XBlPTTs20gkt2Dc2Iaf7eoCknMKqQqmaiAnSi4+8y/NHw
	 9om7L7PhLm1BBakxTzsTsHSMk/biPCk2niwaBlJv8oDIN2wbvg6zemZLDd/jVa9WaDokT
	 GeJGf2aFwSk2I+5As/qz2E0G0zbu9PRhSADvuimZsWoSQzFDHffgVpLYaHja+KAM6jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=isCDh6uM;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEE0606A31E
	for <linux-remoteproc@vger.kernel.org>; Tue, 24 Nov 2026 07:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0CEE0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=isCDh6uM
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so2822496b3a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 23 Nov 2026 23:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504480; x=1796109280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wS4At43W7m/1czA+JG8xGkPi12kG50SZ0Tv+e+jtFSI=;
        b=isCDh6uMy8QBNjMbiFtasKU35zCXhJAPQ9gO9fuxIAnyN2riSk/ZuMRWoyxi6Ic6mB
         b9t5SorjU5/FuNw6ZQkymyV0Hrulj1nEL6tn+jek9QqOafDKSFUAXNLpZsqZH7/hS/ne
         tnRa9J1XQARRwCpQmkT+MnExa0Dmua13U9ExAEfFEA3ROvjqptmywKROgALJtpmcxlcn
         VTRNFlb3r2k8R2GcD0/LQC9hReYEw9C4MZuE27XrKeSBEItGfgBYoMlif6ORopSxoUpU
         r3yKITzYR6pZWJJy3GDvDiG7g7Wo1Ei46X4O7HsHpk+wwlFMNIe1jgAPUE37Ikv4PTDc
         63LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504480; x=1796109280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wS4At43W7m/1czA+JG8xGkPi12kG50SZ0Tv+e+jtFSI=;
        b=pGeG/WkOWpJiiOG5mrXka5SDfiD7glWyDmJ5AVoR5pTEwxiKqQDS8Pc+i4BSNA57Kq
         D2HIzP7KI2qFV6lPdnm0VN/GU+SUprIPBYqg5JGqHChaFddAXHkaOT1+ZScF8AhM7uEG
         vbec/y89Kkq4gO7mqW8F2zBk9iJDoMuCo5E7CCuuzeCedodsm/WAghpZJkBXKziCXIQ4
         CUXmsJjQ66fC09hs1zAHB7L3Ud8kKUnRZRWwINQm3dfA1+JJLY52YaQwzuiTdcPxscs1
         Fsovy3K9S4lLFiO1fd+bN0egWcF+Qa05qXk2L8d1xuC+Og9V0AQ7r2qOeU4V8rZuCf8V
         zFGQ==
X-Gm-Message-State: APuU4Z8yZo5KTJg2wMc+O4FNMjhmD7zRQYc4XC6B8gh+eJGYqXp3aOw/
	20juHAPkZT9KsypaDzz+/PXmtAY77iU6aKBfDVUNPS77sHj6kiY+I07TC0DQ5luM
X-Gm-Gg: AZFdTZdd5QIuQ3auKfcBO91YdbhUwq1LldslnaTJtSrqElJriIvdyKR3ud79xTkmzQI
	kv5lqyg6x9PW16/myb08uM4+NfZp08kYHZpk1a8jg7SMwP4c3nCSXVV9G5aSLgbO7b1vjQoWZNX
	A3/9w56Y4hbdh/JpX8eUD/Lc56TqgiDTYLjH7JwfkczyvPOBxMZJDZpa1L/0j7nVyuRcvIaUOcw
	qgZ8yfg9Zobxs5/B3J2JaToeiesOiF4V1tB7lG/Y1hZfu27jiDapPThbiZuvOY+sNpOQpyRrPrd
	He2egpxw1tLA1Xxl6QN9b/iTV4BW2VQLIbSekX46pzEGPKBbIv9vNwThpeSp+/60UA691owT/p+
	jAeSYdXwFCAec1FmXHPIXXUntw1g9U+ANIM1Ys2rWlOPN74qVQ1PGbCmTYSZeumZ9pUAILLPfo0
	R9RhQfx+qauolYX0H8JPT+IftF2ZPVowHh1XdY/hv7ZuLROZqFvmNdNuzr64l8yZnFwHEiKAnvC
	2n2WCHjeK54MlwT2WTEJn7cj93O+DUYaF94UVkvxpi/ZhoKjvuUlwXdCft7gSRRYR0ri9xhPCbo
	E5DRIcXJv1YYxpnFstJoSHmcy0byAUlnFnTAexeuyBgb2zC9SR+8AOjGFKZOcqizEgWO+w==
X-Received: by 2002:a05:6a21:9086:b0:3e2:313d:2da8 with SMTP id adf61e73a8af0-4014c752257mr15141949637.48.1795504480156;
        Mon, 23 Nov 2026 23:14:40 -0800 (PST)
Received: from embedsky001.tail6d6b2f.ts.net ([183.13.19.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cfcadffsm6475836a12.9.2026.11.23.23.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 23:14:39 -0800 (PST)
From: Yonghao Zhang <hyz3367@gmail.com>
To: mathieu.poirier@linaro.org,
	andersson@kernel.org
Cc: linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH v2 1/4] remoteproc: core: Reset freed vring entries to FW_RSC_ADDR_ANY
Date: Tue, 24 Nov 2026 15:14:06 +0800
Message-Id: <20261124071409.972-2-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124071409.972-1-hyz3367@gmail.com>
References: <20261124071409.972-1-hyz3367@gmail.com>
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

rproc_free_vring() resets a vring entry in the resource table as it
releases it.  Resetting da to 0 leaves the entry looking like a vring
at device address 0; write FW_RSC_ADDR_ANY instead, the marker for an
unallocated address, which is what the entry means from then on.

The last sentence of the comment above the reset claims that the
cached table is only available for a processor booted by the core.
rproc_reset_rsc_table_on_{stop,detach}() now install a copy of the
table for processors started by another entity, so drop the sentence.

Fixes: c0d631570ad5 ("remoteproc: set vring addresses in resource table")
Fixes: 4d3ebb3b9990 ("remoteproc: Refactor function rproc_free_vring()")
Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
 drivers/remoteproc/remoteproc_core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index d5fa9d23bd5c..b6fe74d34e5c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -417,16 +417,14 @@ void rproc_free_vring(struct rproc_vring *rvring)
 	 * At this point rproc_stop() has been called and the installed resource
 	 * table in the remote processor memory may no longer be accessible. As
 	 * such and as per rproc_stop(), rproc->table_ptr points to the cached
-	 * resource table (rproc->cached_table).  The cached resource table is
-	 * only available when a remote processor has been booted by the
-	 * remoteproc core, otherwise it is NULL.
+	 * resource table (rproc->cached_table).
 	 *
 	 * Based on the above, reset the virtio device section in the cached
 	 * resource table only if there is one to work with.
 	 */
 	if (rproc->table_ptr) {
 		rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
-		rsc->vring[idx].da = 0;
+		rsc->vring[idx].da = FW_RSC_ADDR_ANY;
 		rsc->vring[idx].notifyid = -1;
 	}
 }
-- 
2.34.1

