Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77108280304;
	Tue, 29 Apr 2025 23:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970380; cv=none; b=eIP8MLG5Lnt+2V+Yls/7RYpvqE5oh678Vf/yJXUqfGp/683BfQuiDWXI9J953rNnWo8ibxpKgnRYXC8IvseeZlZdpdeHtwKTCj8Lry9yXTJ3jisfIaoRLx6/pTaM+IC6M20VVE729/KIxcgs8YOhN/gcpHyth4MVrzd4SnolPlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970380; c=relaxed/simple;
	bh=luOfWlOlz4PBjfYizL6+DKGSBxstxC4zS7RETqWbWto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZFNRn/Norz2IUmpay7MBS+KP2Wd2PwOF5yCOGXzzvi7QzYTvQyBCYUUb8bed9rQOXr8G7gYyxgxuDOTO3+/JSN32f07UQd5a40+SvW8V/26e/VaSGl5RKsF7os/Mo6UYk+3quJwe2dMC4pSGd+1Wh+ZBImaJ1rTcU0SC7kbDWTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=ZUuW16N4; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="ZUuW16N4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=TvAamvI5z5ywDPmBeirSnmMoBYPq5JBPW9Fre2ToOAg=; b=ZUuW16N4hq8/SREx
	S2Kif7w+6IlguwkCVBcn/8CeJZT9nm6L3A7z8zLesgFzidcvwPe1lTwRoMJUCyNrzFFVp0Ryw2h21
	Aa3tVwZJjKNRPEYviQCe4+izSIMf76MtkuEX/8ANFhD1SCfb1BCXk40PCnH+Mob633171/C5WXlij
	I83A0DU8O1TEPtcQP76mvcmcfjBe3YXncJjRu4Fz+j08e7nwkZb6nNCGfdYYSzus1EqnFOfLuwNfL
	hVJ3cSop7yqJEUluFS6FLiHX1TA8SOGBOhVYM5cCaKt1W1dF8C2/Jg7uXVY3/5bVxHeiry/5ZGYFs
	WNpZ8FEbDNU2gNOSTw==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1u9ueP-000WFz-0b;
	Tue, 29 Apr 2025 23:46:09 +0000
From: linux@treblig.org
To: arnaud.pouliquen@foss.st.com,
	andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: corbet@lwn.net,
	linux-remoteproc@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH v3 0/3] rpmsg offchannel deadcoding
Date: Wed, 30 Apr 2025 00:45:56 +0100
Message-ID: <20250429234600.301083-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Hi,
  This removes a couple of unused functions in rpmsg,
and (v2) after discussions with Arnaud, follows the thread
and removes code that they would call.

(Build tested only)

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

V3
  Fixup comment on rpmsg_send_offchannel_raw(),
  removing the reference to "_offchannel" - as per Mathieu's
  review

Dr. David Alan Gilbert (3):
  rpmsg: core:  Remove deadcode
  rpmsg: virtio: Remove uncallable offchannel functions
  rpmsg: Remove unused method pointers *send_offchannel

 Documentation/staging/rpmsg.rst  | 46 -----------------------
 drivers/rpmsg/rpmsg_core.c       | 63 --------------------------------
 drivers/rpmsg/rpmsg_internal.h   |  6 ---
 drivers/rpmsg/virtio_rpmsg_bus.c | 24 +-----------
 include/linux/rpmsg.h            | 22 -----------
 5 files changed, 1 insertion(+), 160 deletions(-)

-- 
2.49.0

