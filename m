Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE97A35E1B5
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Jun 2026 08:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782118339; cv=none; b=B/FIWQitrBFHN7FYVGUi8VXs9EpoJtQWlfgLo1v9nrwpFj/S/bwG6I2EbKNQyhLjTKfVA3HutimWRW3++pCTtzwmg5CjhLsvC3DFvBPbcZ/ru4AEol1i8r1wSCgMTFRLHjOdE8HNf0PgqfXWc+SOtznJDeJYAi3hLVp+hiptO4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782118339; c=relaxed/simple;
	bh=7grLb8fpXdl88V/G0DH0d6VvzMgy79Jvs3Cd+JXNhTc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ag75Rn7ibw+g5TByrBOMpo7pfCYD7wMId3AQIQl+5x+U6IZ4T1zwFtFTxWf2A9iVnqF2so/GRe7WJcxlXLvO2xroVYEe2yy16g4AWCTg92ZRXMrGf1od9u1QHVinN/NhUFA4sGeX+YaSVm7WQ+dwNKZx5gjTMtwDPjruIntzGPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CmsDZozV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CmsDZozV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=58x3xnDGzSsm6q
	cobwOQ+q8gCfYb7i9HbwnHo+j3tfk=; b=CmsDZozVLo3nc7WU2qYHIc+lVBOCLP
	tvkOye1So5m/IJgDibwOugLLlaUV1ZApQWy4ZZ756FJeoTgOql8V7JXlPmMK2avE
	UFtFfGuV19KDd8qUs8E6+KlK5nO9fhfkJjfrOZWgZTANdulF/COSHLgBiMGx7hU6
	KDj6sIcJ0LLLBF8gLiSeqgymCLyFDv3p1qkN79D1Wo2IVTJwme8TCLnp5azwIq51
	EwaLQ9Mz9V9FRjNPmp1Oy9Isd80034ilY6TBoysetdnb1UAHbjEQv79ibYh6Dgki
	VYqHxQZ7qHk5bwE4MMdE9yQQXHpahwsg9cDgXq59RMGfT3O3iYyYxvgQ==
Received: (qmail 1894039 invoked from network); 22 Jun 2026 10:52:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Jun 2026 10:52:06 +0200
X-UD-Smtp-Session: l3s3148p1@/wrPwdNU9qQujnum
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Matthew Wilcox <willy@infradead.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-remoteproc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>
Subject: [PATCH v2 0/4] hwspinlock: add summary in debugfs
Date: Mon, 22 Jun 2026 10:51:59 +0200
Message-ID: <20260622085204.54248-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renesas R-Car SoCs have their spinlocks inside a unit called MFIS. Up to
R-Car Gen4, there was only one MFIS unit on the SoC. Gen5, though, has
multiple instances and, thus, multiple spinlock providers. The spinlocks
are meant for specific cases (AP<->AP, AP<->RT, AP<->SCP...). For
development on these systems, it is helpful to have an overview of
registered spinlocks in debugfs. This series adds support for that. The
first two patches update the radix-tree header to support more lock
types. The third patch fixes a missing RCU annotation for the slot
pointer. The fourth patch finally adds the desired functionality.

Because the radix tree seems to have no dedicated tree nor maintainer, I
suggest that all these patches go in via hwspinlock. This also keeps the
dependencies zero.

A branch for testing is here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/mfis/hwspinlock

It has been tested on a SparrowHawk board (R-Car V4H) and an Ironhide
board (R-Car X5H).

Looking forward to comments.

Changes since v1:
* dropped patch inverting the HWSPINLOCK_UNUSED logic
* added radix tree patches to support the mutex treelock of hwspinlock
* included RCU annotation patch sent previously as independent patch
* addresses Sashiko comments in patch 4
	* ensure correct locking
	* add error codes
	* proper ppos handling
	* no leaking iterator when done
	* mark pointer dereference as protected (needs patch 2)
	* split up long lines


Wolfram Sang (4):
  radix-tree: add parameter doc for radix_tree_deref_slot_protected()
  radix-tree: allow more lock types with
    radix_tree_deref_slot_protected()
  hwspinlock: annotate slot pointer as RCU sensitive
  hwspinlock: add summary in debugfs

 drivers/hwspinlock/hwspinlock_core.c | 91 +++++++++++++++++++++++++++-
 include/linux/radix-tree.h           |  9 ++-
 2 files changed, 94 insertions(+), 6 deletions(-)

-- 
2.47.3

