Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795379065;
	b=mUvhKG8LdPGhBJabNCbDuniDzn2LwdosmSkdxXErCqg//zyWTqB1mrcHJbJs7K2AR2jY
	 Fo1wZLIH+klVIH4vgGVT/yvb+O/9UAeOLQEu5apGWscKDWCuG8Pt87VS1U1pmI+nXrBdD
	 P63NYX5CT4UnXroLGZDHZplzjyecSGja0hubQqpefRaUj/B2WZ77XbO/nsW9uYjrqv5i2
	 etQjdR/v2oYShsm7RjzeV727Gvz3iV9jTsD83MBbPKjHqnC1uNaI4of3G1mx8OG52QIoS
	 2yrfXaA4BR+jrgRHMXlBdJmo8fMNv76nrisd3QKBNvRgHtMN3/dLdIPbNeULzxFV0fA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795379065;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=cshyvm1RGfi9h+MQQ0UCkQXgQEVUysI3Bo9qnIeDWks=;
	b=oEWdmRUL2Twa2NgyZvqyO6W9I+RTqQndQr6GDk0j1ooJRX/ckynKZEey6+mML9fpOkoC
	 /WoQmiH87SK2Dl7b9DnBmQO3eFPpO7Jauaxm0alCPzeUj9uI/+vvPMyaGSwLRUuH1iWVC
	 X3wx1DhMiAgc9Cu8YcarEbzbeyL+nI0ALaRkjbp1vNdFsrdapwoflSmLZhieHr+LlEehe
	 uefNiFy/ReSeSuHRwnfcB415NjFUwfDPIAHII3fovgNSZL/nYoQ5SSUU+G9kZqeOCB0cl
	 SzSwPfY581Ilp53tlVlaVOKZj0rWqKoZEYITbvcedaz/wxURYHNHeponxXlXJh5yung==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FxahAm+S;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B51A606A31A;
	Sun, 22 Nov 2026 20:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FxahAm+S
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795379065;
	b=Wjss74g6QV0N+ACGnvymx+sz2dqKiG0IIxnUbqQYBIjqy/Kp6fEZgV1zL3ZxZJsi2Oca
	 xmhPssiHBn0+Q8BSiAfxVFVSujHExebOSe73P7l5o7I82sAICmfnCia29ygH4IaIe/xDg
	 +QhZlxseBCKqW3GUXMiopkUhZXPiVr9hK7VBlsu73LjPjK91m8Fs53+KOfMrGDdqgobq/
	 4upwFW2aI7lolZ3wHo8D2hMq+GONvLdjWcdnyEYaHHR0akJuOlfCWc6n4wueqzkvMG+Ym
	 MRIh5h/2C23Ii/ty6aeqROyYhgvefNzP5IeONaTE6B70h6Xc7rPkU6xpCAXeIP1d7Ug==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795379065;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=cshyvm1RGfi9h+MQQ0UCkQXgQEVUysI3Bo9qnIeDWks=;
	b=FJRBq69XzuBzWRDmO5/o79P7e/coSev2JA4rPo/PgiYB/b5fswT+Ip9PRbO4GAz1r60U
	 zgHyAnESE9PeEVUVeUjXcnavLNR4BwIjrn3JptnoO0CHy/5tstETzdrWar3xQNfEzpvbj
	 qpFXw2i12jQhloUma/c1mvSYoSyVN3g5WeNjRzT0wuOBDtseAZzo2mdmppPneLEg9wqe5
	 kDIklDEYibHy7JvwzRRVynZuys0dzVzuycIjVzI2sRNWKkw6xUwnSJ3+WX0hIUPf50Qg2
	 uRzjtDSnz02HDogjbNKFg64sCIfK5L9H6WGH6Jd1bIgeGWzxtD6d6gJB2kmApIcTt9A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3ED841F000C4;
	Sun, 22 Nov 2026 20:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795379065;
	bh=cshyvm1RGfi9h+MQQ0UCkQXgQEVUysI3Bo9qnIeDWks=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=FxahAm+SSqh/1pcAyamkZNfIofSpWuB0P/PgSFCp3U2R6QK9eUK8m1yibMqZprH0z
	 D2AG0Oxv918BNILlnFkI9eXsQXp0etCyRdeBd4beuBiBM+fv31WSVBrQzZ+6Ap/J70
	 K2SrADy6lZvTmFLia4KTbT1pIQ/y1NqYs2+6FiByZEPkBOlXjZ2yGhXZfFT3qpLt84
	 +bEPE9TcG8kYtr4o0jovpgehYMdASmFXTftd+vUVOCtCrQx/VbZeMk6ou5Pqf1yIbY
	 HnxfH02Ia3Ja7AcdXk8h92pByDtxAb8WAwjkhZkdTnErLapA/Dglh0b6Yhru0FtP+6
	 jeK0qQzv8ZhHQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C47594C1F2;
	Sun, 22 Nov 2026 20:24:20 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 0/2] rpmsg: glink: Offer wakeup capabilities
Date: Sun, 22 Nov 2026 21:24:17 +0100
Message-Id: <20261122-rpmsg-qcom-glink-v2-0-d60419793095@ixit.cz>
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Post: <mailto:linux-remoteproc@vger.kernel.org>
List-Help: <mailto:linux-remoteproc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-remoteproc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zXMQQ6CMBCF4auQWVvClILgynsYF6VOS2NpcWqMh
 nB3GxOXf/Let0Em9pThVG3A9PLZp1hCHiows46OhL+VBtnIDhEHweuSnXiYtAgXfLyLQesJm16
 21nZQbiuT9e8febmWtlymz5lJ/6G2QTyikgpVPQ7tqHqBwuhAU21SjCmEz7nQmlOd2MG+fwElC
 051pgAAAA==
X-Change-ID: 20251118-rpmsg-qcom-glink-8aab10623ff5
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Dylan Van Assche <git@dylanvanassche.be>, 
 Casey Connolly <casey.connolly@linaro.org>, linux-arm-msm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3470; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=lTm79sP5N4nCYtqwli3hsRaQG2T1k37aH17D2Pp90kM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrA09yN87Arpx4zHDSlaRNnlb7QYe663LjdDuCL
 o27J6X+XTaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawNPcgAKCRBgAj/E00kg
 ch5NEAC566yogcpJwCKgrZkbDk+lgF3bYCcnlCI1Hy52FxHt9HS5kpKbZAzq2iE63yvS+6N0kHm
 YoCPGSXr2fRRFqp0kKRATDk+qC1+9PrbEVnRmnzwlckERaAH7Lkk25AXHtqNYh+tqjDYgCoTUZS
 wN8BFhpXqeiTx7iqIHIr3QnOsVgDrDhXVqKDWy3g4e7SEkXdziGukNFVVA2KcaMm9j0Fnh2nh1E
 ec7Pb3Nf6bC/hjaevCMy1a/p5OB9D2V4BL7MNZbZPNMn+w37Ngof20ZaE0z5Zc7cWk/1OaEcESX
 owZtougwnAXtLlYhw2anbY/MLGAZWdSXPnOOoBh/XxPbjXml8dpgnKUgR2i1q+UrLEgGrWjh9Sg
 pC/1DxGYKMMRjzwpYIapUQPNiyeBDzS+urnzjBUQnSBprcy63tSwxLbQ4feRH/59LtJaN6s0e41
 4choAag5jPQi8jmKOva/2kxDWHj1YCiqB8bfvSyX6FYKmnEaTzHiEThvnI/EFGdb1sAdwf1EtQF
 ux0R+bldKNbKpUxgm+8tDlT22QII5SCLQ23Mr7+/5F/NLOIAOLO0x8npNg/Wj+xDtboykNj1a1w
 xTj4RaudHUCzK4Hx8Tz6Sb/xr6tTFj3Lwpq0MrrR8fRlzHgK0WVw0Q7bR/Sp/bQM3ftqk8+MkFG
 6zvmjsxoqjIFoKQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

LLM generated summary of the decision chosen here, feel free to skip to
the changelog.

Trade-offs made:
1. Sysfs power/wakeup switch vs per-socket EPOLLWAKEUP (from v1 review):
 - Chosen: Device-level sysfs power/wakeup (disabled by default).
 - Trade-off: Works immediately with existing userspace (ModemManager, sensor daemons, udev rules) without requiring application changes, at the
cost of channel/endpoint granularity instead of per-socket granularity.
2. Reporting wakeup only inside if (channel->ept.cb) under channel->recv_lock:
 - Chosen: Gate wakeup on an active endpoint callback rather than adding extra synchronization around channel->rpdev.
 - Trade-off: Keeps GLINK locking simple and avoids waking the system for packets that get dropped anyway (no consumer), while holding channel-
>recv_lock across pm_wakeup_hard_event() (a short spinlock path: dev->power.lock -> ws->lock).
3. Solving /dev/rpmsg_ctrlX wakeup in rpmsg_char.c (Patch 2) instead of falling back to channel->rpdev in GLINK:
 - Chosen: Per-endpoint wakeup on /sys/class/rpmsg/rpmsgX/power/wakeup in rpmsg_char.
 - Trade-off: Transport-independent (works for GLINK, SMD, virtio-rpmsg) and covers locally-initiated endpoints that never have a per-channel
channel->rpdev, without complicating GLINK's channel->rpdev lifetime. In return, userspace configures /sys/class/rpmsg/rpmsgX/power/wakeup
after endpoint creation rather than the GLINK bus device, and directly bound rpmsg_chrdev channels expose two independent power/wakeup knobs
(both off by default).
4. Immediate hard wakeup (pm_wakeup_hard_event(), msec = 0) vs timed wakeup (pm_wakeup_event(..., msec)):
 - Chosen: Same as v1 (msec = 0, hard = true).
 - Trade-off: Immediately aborts suspend / wakes s2idle and bumps wakeup_count without holding the system awake for an arbitrary hardcoded
timeout, relying on userspace/suspend managers (e.g. via /sys/power/wakeup_count) not to re-suspend before draining the queued message.
5. Setting wakeup capability after rpmsg_register_device() in GLINK:
 - Chosen: Kept v1's placement in qcom_glink_rx_open().
 - Trade-off: Works via wakeup_sysfs_add() + a KOBJ_CHANGE uevent, though udev rules matching only ACTION=="add" could race with power/wakeup
creation on the GLINK bus device (Patch 2 avoids this for /sys/class/rpmsg/rpmsgX by calling device_set_wakeup_capable() before
cdev_device_add()).

Changes in v2:
 - Use pm_wakeup_hard_event(&channel->ept.rpdev->dev) inside channel->recv_lock
and the channel->ept.cb check to fix the NULL pointer dereference,
dev->power.wakeup/rpdev use-after-free races, and CONFIG_PM_SLEEP=n build.
 - Fix subject prefix ("rpmsg: glink:") and comment typo.
 - Add a follow-up patch enabling per-endpoint wakeup on /dev/rpmsgX in
rpmsg_char so dynamic /dev/rpmsg_ctrlX endpoints can also opt in to wakeup.
 - Link to v1: https://lore.kernel.org/all/20230117142414.983946-1-caleb.connolly@linaro.org/

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Casey Connolly (1):
      rpmsg: glink: Support waking up on channel rx

David Heidelberg (1):
      rpmsg: char: Support waking up on endpoint rx

 drivers/rpmsg/qcom_glink_native.c | 12 ++++++++++++
 drivers/rpmsg/rpmsg_char.c        |  2 ++
 2 files changed, 14 insertions(+)
---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
change-id: 20251118-rpmsg-qcom-glink-8aab10623ff5

Best regards,
--  
David Heidelberg <david@ixit.cz>


