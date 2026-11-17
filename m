Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794945082;
	b=LkDLxYZEwzmMnD3iyy3xeYuIc14bCq6+KzvFo9P9mvbJKHioik68mJereV3XQ0/MP6ev
	 A7w2c9nNQsTExaik5Te2qLk0PtV8Uh6aziOVOdSNoHIG9b/DpNzI80w9UPgMKbCoV9Nta
	 4LnBZL4WDMYS1e9t9BlyKyV7AG7LcsY+S65sVKH6ExD+kAhD/s4QHVb0Cnh5jeRuZ8JHe
	 OLdSnRAmo9+KdofZKa412zLYCm46o/NN+ZzQr9arxK4Yw2k47nXzUtggrlOmy98nqVb4J
	 oWJdz4+xl7vhCq7RM/68by6zEffArDYtki4MnGJTpC0gSBEGZEcZNLsKkTEu8kWQF9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794945082;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uTjaLi5dj9XDX4pgv1s2Of5x2i3A/PnJrfra9kxBKIE=;
	b=qj7uehRLPzCK1KV5eK6DgH5krN4Da09BSciTAb1+R8Zfv0kRug5HaYVs3zqREXvxnrnW
	 li3ZAFpYIzb2fduRzntOi2MYbwX0j6Fs9xvN9Gc9ahypNXrVTSldRsUWB2DA4TDG2dsUM
	 k28UlfwW+WzMHSnrdw2GJxZgKSxVJeIC5HbRPrpwTWdGpp+GwydqqNZUd9u90Rets/17I
	 yCT8XS6yoi+THOkAl6AF2nk5gWyYqPwW/AYlpxCSvtaUxjZPI9JKesE2hrMf8dL3tdpBm
	 4AwwW5PjLotQh9AVt1cz9s1CwX297VjiobrLOAt/eR+9hz2TY7MXurCIrgft2ZEcVJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iS8pT7eQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9008E606A31C;
	Tue, 17 Nov 2026 19:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iS8pT7eQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794945082;
	b=XBV0ctg6YF8DlgKBsLSEpbRs0NIyTQJo4T3+fvUGkDoP+bun8t7MAKH1ec4jLqzyd21p
	 escnFU5Zwbin4WU/K890NOp14p8//zeIAlLfI9sQgtXNpJoNl+Ae1J2nTaPELB0DqXCgS
	 1e5bN49OnWdYjzEDrPo4bCA2PbccW5IUzj/TRxMQy/f8ozvKYGIpNQ39K9hZHFwRL7Nmi
	 54yXzdo6B/LP6seVQW5xrxB7Bt9Ttd+37eni5/R3NbJOHLWBJnID7rB1Q03TL7PXhkEoK
	 wj1ZErJ22dpcs2QSxADfdE3nsdYY76LNIpnu8ZX839wFmWaAvbAtVeJBCf25Bre3PFA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794945082;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=uTjaLi5dj9XDX4pgv1s2Of5x2i3A/PnJrfra9kxBKIE=;
	b=xUJJPQkSm/l8CUnPnQriwkG7JGJjyCSz9kUclQQQSwSNffMxEJxN5fUhAFbzLNpeX/Bz
	 MWLiq00f8iEM2uCUz6iof5BlhmbkmA6emUJ9dTSV84ZJ2GqTPwv3OI4k+6/lRSZmOjtxS
	 SMo7ZT2TuJ+vb5SdGkTQw5E3SPVTOycH+/2938RoHnEFDTUGCH/85ENxv0LnnHeL8H0/u
	 Oa7hDzbKGuIEJWUJtRgTuMnE/fdAl2pmwMQsFtU5ipSSoSuY++5sbbC0C7GW9z5bgH3wm
	 vw9X9IxX7a08p7jE1JyyB+/p0rsDswFzvpyLqyGWCj6aYfylbgO88oZYkNOx7ePMGgg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83A341F000C4;
	Tue, 17 Nov 2026 19:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794945082;
	bh=uTjaLi5dj9XDX4pgv1s2Of5x2i3A/PnJrfra9kxBKIE=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=iS8pT7eQ5DHtCbyKLzbCp8LSHZ+2+Zj5mlb6vrgqxWnhC3J+1zZMgkMArkU7MYoCu
	 7NM4pHebSvj/MTtInaCxwKAJKj8kuO1hQSIGHMU9q+rCBcGtIIkCaRLGzU3w8VwNSs
	 PmgydUnWgDFZ2YUzForbe9f07eI69HiCVpyqOFiawrsrj7LRAxhjqHRHtsqUl5fWgS
	 h/Xr9Se3cqS/nVGgsp3HedAfkEN12pBV/Q0TRS7rd/FYV6Nej54TJoORXuswBnJqNp
	 2kM0TofASVEJRJ16xxi01id/E1dQ6y9l//LL/f/RqqUykRorB6I9T8oKGLwsQEo/Ni
	 /wwUWBVTNbdag==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C561D4AA6A;
	Tue, 17 Nov 2026 19:51:20 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 17 Nov 2026 20:51:18 +0100
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Save the need_pas_mem_setup
 into qproc
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
Message-Id: <20261117-qcom_q6v5_mss_msm8953-v1-1-0fdaea2855ff@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Nz3cLk/Nz4QrMy0/jc4mIgzrWwNDXWTUxKtDA0NTI2MjJOUgLqLSh
 KTcusAJsbHQvhF5cmZaUml4AMU6qtBQAZG3wJeQAAAA==
X-Change-ID: 20261117-qcom_q6v5_mss_msm8953-aba81523223b
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=YXA0PBEQxG7y3KQPuhFsjnj3v8mXJmuKIs88QrqT56o=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBq/LA3t4wTRLmCJRD8Rbmf1F2YC+5aKN1QBaJ6W
 Vf6R+LYyPaJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCavywNwAKCRBgAj/E00kg
 cjKFEACm4UVdY1Sc6btYgmxzmBtq/95vt8znRQ2e5Uebw9/R6eOFohV3r1xnfyYTQquxU8NDuqm
 f3gAvlhpM4fw7aA2QZ73jD3CfXZR1NOP3aBJ7T17H/KKNnuHVsg/uW4iRxFc1G3MsAOYwpafMRH
 isoj0sY2qMgKKP6QWnQZRVy+aR53VmfXaSKk1HGWazqj19BF6qyXK9hF5WVvk9QkaVgymiqR8w6
 FedoyuHicdvmrM76j23H5hISpGU9OgX1/Sp7cEwXlNDHTRXxE3v6TlL2MnFXJyWu/1BGR1Z0l6T
 Nw2nPPmgheWJFQVABOXMsCugpffHN8A/Ag61BDxvMnkcB0RxUrouf+77BgLUUd3g5Cr59N2llTM
 rB5Fg4LK8t9gDAfCSZ249VeoxihlgBDd0kvElH3x+DCx9hAEWaWsP7cj4cXfrJwqzihoGfHdrR4
 e5kqvkGqiYpJsZghgiRwWAg5pqimQfAsSd8zp+oh2bokXNtRoX9jpUwW41wBrP8uRBgJ1iUg4mk
 5jpqaOWYxzYkKKc9/3Lbjw3vq2NLkXOD8bpnF3KOu76k8NT20mdgrPnQbk1s3fM+HMfzla2jdZQ
 AjptKnUD869OLIZTNvczaQgDj4OynEQB/jgDFAc2bMIW7R1gOcZqEwk9eOI2Q7JehRNABEl4jkL
 jQnvLHzHaSteBmw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

On hardware requiring Peripheral Authentication Service (PAS) for modem
memory setup (e.g., SDM632), the remoteproc subsystem skips hardware memory
authentication because q6v5_probe() fails to copy the need_pas_mem_setup
flag to the allocated device instance.

Original commit didn't save the value into the structure thus quietly
skipping if (qproc->need_pas_mem_setup) condition.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-83fcbc28-236c-48e4-a6bd-731f4361f9ae
Fixes: f56052f4d87c ("remoteproc: qcom_q6v5_mss: Introduce need_pas_mem_setup")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index dd052a62b8583..5d084aa2eac36 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -2189,16 +2189,17 @@ static int q6v5_probe(struct platform_device *pdev)
 
 	qproc->has_alt_reset = desc->has_alt_reset;
 	ret = q6v5_init_reset(qproc);
 	if (ret)
 		goto detach_proxy_pds;
 
 	qproc->version = desc->version;
 	qproc->need_mem_protection = desc->need_mem_protection;
+	qproc->need_pas_mem_setup = desc->need_pas_mem_setup;
 	qproc->has_mba_logs = desc->has_mba_logs;
 
 	ret = qcom_q6v5_init(&qproc->q6v5, pdev, rproc, MPSS_CRASH_REASON_SMEM, "modem",
 			     qcom_msa_handover);
 	if (ret)
 		goto detach_proxy_pds;
 
 	qproc->mpss_perm = BIT(QCOM_SCM_VMID_HLOS);

---
base-commit: aaa2f954c21b205a0bcd0961e5b2be4e82e58455
change-id: 20261117-qcom_q6v5_mss_msm8953-aba81523223b

Best regards,
--  
David Heidelberg <david@ixit.cz>


