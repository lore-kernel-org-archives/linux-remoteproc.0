Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247093;
	b=tCsrSHwMRRERqMwrJODCs4+icthd28yGamTZRE2ieWzTO2A+5ldYt3KUrX94yDELtIjN
	 M5IFVAO003mspvK2nGi9JKE0tWLZ6NZ/TZbDQ+vKzU88uZO9jK6ptQobCQHmNMMZey7/a
	 C6tO7Mv+bXL7NGTIGLJCp98POTN5CEQfkty+wsNIbhMQzsEmKRPWcYoEso7TdX/1b5Lji
	 qwRnd//pv9p8jSo7VfRPPiGfwNwWmIJzp4fLK4tfjzAT67gpK38rZUED6GFO2Cn8XMQxo
	 Kwior5ZbAkFaUBBG18KewW+PQLC4aXLtGoWOGAVSwSspNiKswQA/sz+srJFKEhgWbjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NQFcBegZVinznGcGamAVLxh2DaKy3WmcCJmY9lmdZkM=;
	b=3oJo3uUEpsxWciCU5++47oAaaE2DbVm2l7zQ4mZ+8h8JQJF2mcQJwRvgBIlytt6WHO5J
	 SHDLNzW5X2RxnFZRqam//Svs/PvyVVDQ4OaVh4uKjsTs/FojVnFzsJHJcFwLaKeE7mYjO
	 x2vlrOuPbpplSQQyGJgl2++tN2NG0TFRl8Lh1BFQtS8X0+icOx/Qgpn7eYcMvSuCCESPt
	 hpHwyKT3st/MKP8tWEOop6/nh88sojzo3r0+f6tL3N+GeKWigND/Dcc2JiIKETGSTbNEH
	 r8OSy9zt4eVjqv/vKWPTHqbXkGVxg9tCOfAc2/o0L6llh1VC1k71vozrTrBETIfgLSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=luxonis.com;
	spf=pass smtp.mailfrom=luxonis.com;
	dkim=pass header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=hVX0AILp;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D69606A32A
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Nov 2026 17:58:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71D69606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=luxonis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=luxonis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=luxonis.com header.i=@luxonis.com header.a=rsa-sha256 header.s=google header.b=hVX0AILp
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-490c1d337d8so848347f8f.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Nov 2026 09:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=luxonis.com; s=google; t=1794247092; x=1794851892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NQFcBegZVinznGcGamAVLxh2DaKy3WmcCJmY9lmdZkM=;
        b=hVX0AILpInoPfFisEkn/YXDFkZzXheGdiSemxWWm0t5cmFv4OFi+6aXEbTUaM3mJox
         h1bQ5xmMku7mNUGnqOyBK+rA6jXs5x3sUZ/+0OACH3kuy/E+2694CldtctlFo2kkqDJf
         ivyCrJT7ZVn5StfQfVydFKmVHapg05QbPWTzE5ywJs/VQz9zrW/CgHt2asoB6yH0zyz4
         2+MYYPO7SJMum3X7wnYJ0iC7cR/2xhKqXfm5J49tinJTqSF5Vn+M40KNXAfs6mcGb42w
         bVK1e7wZrrEYzb3K4jkpGiWL6Bo/kQHZir/pi6QCuwtr3wLOqxIUIUb+u+fgdeCorrgF
         2ujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794247092; x=1794851892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NQFcBegZVinznGcGamAVLxh2DaKy3WmcCJmY9lmdZkM=;
        b=RKhQcg/FVCEZ+/THz+xu4lXDXWOAdcMQgtbKJEwRek89xTlYOZ0+gkPq2xM/ACGLHn
         UYLxLIpVmWlp/IJ4TWEeorNN0UDLt7y31zNwPVCGMZqAwii8TBs9ZojtmK1rEPGqroH3
         XHyfYUBjjjf1/CY5ps74Oz5WL4r9bidxEm7iz8lSgnbej8KaSWtwG6vi40Jzle/Xq3YA
         Ydg86vlW0cbvOD14WKV8cVs6nsazPuS2+SehFoi2UfHmb+kR3zAdn7s6529eQB+3x2Ut
         W8lEQu8+32RAigcNnzsaTIHm7/COE5/Q55zZFlkHIBrkH8eFWrCDC/pOSL7oMyQ3thpH
         WZYg==
X-Forwarded-Encrypted: i=1; AL+hErF04urROIew+kMhhmtOKVJdY62oja6n4FaDadTD49qkge8j05rZ9LLNajpoPVsL+LG3FnWEggW0K3Fin+bsa2D1@vger.kernel.org
X-Gm-Message-State: APuU4Z/qzILPWWujCkQ4kdQD0Ha6ORoIvvk5xdTd7MZv5flCZWmsc1em
	ZLp+D6Kki4+qvgHIj3VfKSKnE57mkFD4iU6HoHL8w/vXNTZTl67/6lBk8w331jbGzgkh5PzzT5k
	slwh5jY0=
X-Gm-Gg: AYBFou38BElA2Wytp0IoKEwxkYqx2wVfk92HMTRS0BmwiqdvAlO1bS0P5PSZEeO+9Mc
	6QsM4NR0eR1CVsMyjHI2BIyxVBjHYedle3g5WM7SlsFp4Ra+UXEkaH+tvhYXZnh4cu0x0l7HhQW
	MBRlseXukSkODgKea3pWIycJIKFkiF93G4iSzTjpb6nJuC2NOn3MA1ZvqhTxhEd/wmqGxQjQi0Z
	AJSxzZc0+M2xbfM16G+klTXOioQ2uT5xw3KN+CTPj81qSoC5qtSSiW8tX9WG17xyxTj9UgzaTvC
	9KCAghh722SpOnxLDdQ3CATEFcm5pgB51Ls7OZhRr3aKjj+g0M5d8HiWZLipDdnaQgoIkrshVK3
	e4+RZetM4pm50gHVbg7gHsKn4vl0JdnXWDhsg7UfAfSJrp63YPuBdd7AoZG7oL4w+T+fda38YUp
	2g4GNYYGg5W1WnzprRKDGg5BdK5NY2LqeZw0sgWx/O9MEaOF5THeIbRGMipStQCrTkkUbZvs/4e
	ZCh8Nvskr+x1xssSWIOy+ed5uR9tM0LDBpp4oZ86eYoifZrU13/wHp2Ksaf1PFinbE22ivQipj7
	yQJigjmsEQPoBtZMiS0+G3010j5UW2LIQR92Nyq1xjwLHRjWr1mIsFYmPPPCZncu8ZaU+w==
X-Received: by 2002:a05:6000:29c9:b0:490:a481:7ac8 with SMTP id ffacd0b85a97d-4982eedfb1cmr255737f8f.29.1794247091597;
        Mon, 09 Nov 2026 09:58:11 -0800 (PST)
Received: from JureBuildPC (46-150-36-237.static.telemach.net. [46.150.36.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835e20327sm238110f8f.26.2026.11.09.09.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 09:58:10 -0800 (PST)
From: Jure Rebernik <jure.rebernik@luxonis.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org
Cc: konrad.dybcio@oss.qualcomm.com,
	mukesh.ojha@oss.qualcomm.com,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jure Rebernik <jure.rebernik@luxonis.com>,
	stable@vger.kernel.org
Subject: [PATCH] remoteproc: qcom: pas: Request stop before tearing down GLINK and SMD
Date: Mon,  9 Nov 2026 18:57:52 +0100
Message-ID: <20261109175752.793130-1-jure.rebernik@luxonis.com>
X-Mailer: git-send-email 2.56.0
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

A crash of the ADSP that the host reports, for example through the
remoteproc debugfs crash file, can reset the whole SoC on QCS8550
instead of restarting the ADSP. The reset was most frequent shortly
after the ADSP had started: on two QCS8550-based boards, crashing it
about 4.5 seconds after it was started reset the SoC in 19 of 42
tries. The serial console showed that the system stopped right after
the recovery started. Nothing more was logged, and the SoC was reset 6
to 7 seconds later.

Since commit 0ea50486978f ("remoteproc: qcom: q6v5: Request shutdown if
crash is triggered host-side"), qcom_q6v5_request_stop() also sets the
SMP2P stop bit for a crash that the host reports, so that the firmware
takes part in its shutdown. The stop is requested from qcom_pas_stop(),
which rproc_stop() calls only after all subdevices have stopped. By
then the GLINK and SMD edges to the DSP have been unregistered and
their client devices, such as FastRPC, torn down. On QCS8550 the ADSP
firmware treats the stop bit as a fatal error and runs its error
handler after these links have gone away.

Add a subdevice whose .stop callback requests the stop, and add it
before sysmon. Subdevices stop in the reverse order of addition, so the
callback runs after the SSR BEFORE_SHUTDOWN notification and
sysmon_stop(), and before SMD and GLINK are torn down. The firmware
then handles the stop request while its GLINK and SMD edges are still
registered. qcom_q6v5_request_stop() still skips the request when
sysmon got a shutdown ack, or when the firmware reported the crash
itself and the fatal or watchdog interrupt has cleared the running
flag. It also clears the running flag, so the call in qcom_pas_stop()
now only sends a request when the subdevices were not started.

With this change, none of 104 host-reported crashes on the same boards
reset the SoC: 40 ADSP crashes at 4.5 seconds, 20 at 4 to 15 seconds,
20 while the ADSP was streaming IMU sensor data and 24 CDSP crashes.
The ADSP or CDSP restarted each time.

The problem was found, and this change was written and tested, with
the help of an AI coding assistant (Claude Code, by Anthropic). I
reviewed the change and the test results.

Fixes: 0ea50486978f ("remoteproc: qcom: q6v5: Request shutdown if crash is triggered host-side")
Cc: stable@vger.kernel.org
Signed-off-by: Jure Rebernik <jure.rebernik@luxonis.com>
---

Notes:
    Tested on Luxonis OAK4-S boards (QCS8550), ADSP and CDSP, with a kernel
    based on v7.2.6, which has 0ea50486978f as stable commit 0dc9e289bbb5.
    The crashes were triggered through the debugfs crash file. To see when
    the system stopped, a test script wrote a kernel log line to the serial
    console 20 times a second. A crash that the firmware reports could not
    be injected.
    
    Graceful stops through sysfs also reset these boards occasionally, with
    and without this patch (2 of 300 stops with it, 2 of about 290 without
    it). That problem is unrelated to this patch, and I am looking into it
    separately. This patch does not change that case: the firmware
    acknowledged the sysmon shutdown request, so no stop request was sent.
    
    qcom_q6v5_adsp and qcom_q6v5_mss also call qcom_q6v5_request_stop()
    from their .stop callbacks, after the subdevices have stopped, and
    qcom_q6v5_wcss does when requires_force_stop is set. I have no hardware
    for them and left them unchanged. If the approach is acceptable, they
    could get the same change.
    
    Built for arm64 (defconfig, drivers/remoteproc/, W=1) on rproc-next
    672126dce63c and on v7.4-rc1, without warnings. Not done: sparse and
    runtime tests with lockdep and the other debug options.
    
    Tool use: I asked Claude Code to make our QCS8550 image stable, to
    stress it on our test boards and to find why a simulated ADSP crash
    reset the board. It ran the tests, found the ordering problem and wrote
    a first fix that skipped the stop request for a crashed DSP. I asked
    for the stop request to be sent before the teardown instead, which is
    this patch. It wrote the code and this changelog and ran the tests
    above with the debugfs crash file, the serial console log and a test
    script on the boards. I reviewed the code and the results.

 drivers/remoteproc/qcom_q6v5_pas.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 57a111a0d..ddbffe45d 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -138,6 +138,7 @@ struct qcom_pas {
 	struct qcom_rproc_glink glink_subdev;
 	struct qcom_rproc_subdev smd_subdev;
 	struct qcom_rproc_pdm pdm_subdev;
+	struct rproc_subdev stop_subdev;
 	struct qcom_rproc_ssr ssr_subdev;
 	struct qcom_sysmon *sysmon;
 	struct platform_device *bam_dmux;
@@ -429,6 +430,14 @@ static void qcom_pas_handover(struct qcom_q6v5 *q6v5)
 	qcom_pas_pds_disable(pas, pas->proxy_pds, pas->proxy_pd_count);
 }
 
+static void qcom_pas_stop_subdev(struct rproc_subdev *subdev, bool crashed)
+{
+	struct qcom_pas *pas = container_of(subdev, struct qcom_pas, stop_subdev);
+
+	if (qcom_q6v5_request_stop(&pas->q6v5, pas->sysmon) == -ETIMEDOUT)
+		dev_err(pas->dev, "timed out on wait\n");
+}
+
 static int qcom_pas_stop(struct rproc *rproc)
 {
 	struct qcom_pas *pas = rproc->priv;
@@ -1012,6 +1021,15 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	qcom_add_glink_subdev(rproc, &pas->glink_subdev, desc->ssr_name);
 	qcom_add_smd_subdev(rproc, &pas->smd_subdev);
 	qcom_add_pdm_subdev(rproc, &pas->pdm_subdev);
+
+	/*
+	 * Subdevices stop in the reverse order of addition. Request the stop
+	 * after sysmon has asked for a graceful shutdown and before smd and
+	 * glink are torn down.
+	 */
+	pas->stop_subdev.stop = qcom_pas_stop_subdev;
+	rproc_add_subdev(rproc, &pas->stop_subdev);
+
 	pas->sysmon = qcom_add_sysmon_subdev(rproc, desc->sysmon_name, desc->ssctl_id);
 	if (IS_ERR(pas->sysmon)) {
 		ret = PTR_ERR(pas->sysmon);
@@ -1049,6 +1067,7 @@ static int qcom_pas_probe(struct platform_device *pdev)
 	qcom_remove_ssr_subdev(rproc, &pas->ssr_subdev);
 	qcom_remove_sysmon_subdev(pas->sysmon);
 deinit_remove_pdm_smd_glink:
+	rproc_remove_subdev(rproc, &pas->stop_subdev);
 	qcom_remove_pdm_subdev(rproc, &pas->pdm_subdev);
 	qcom_remove_smd_subdev(rproc, &pas->smd_subdev);
 	qcom_remove_glink_subdev(rproc, &pas->glink_subdev);
@@ -1081,6 +1100,7 @@ static void qcom_pas_remove(struct platform_device *pdev)
 	qcom_remove_sysmon_subdev(pas->sysmon);
 	qcom_remove_smd_subdev(pas->rproc, &pas->smd_subdev);
 	qcom_remove_pdm_subdev(pas->rproc, &pas->pdm_subdev);
+	rproc_remove_subdev(pas->rproc, &pas->stop_subdev);
 	qcom_remove_ssr_subdev(pas->rproc, &pas->ssr_subdev);
 	qcom_pas_pds_detach(pas, pas->proxy_pds, pas->proxy_pd_count);
 	device_init_wakeup(pas->dev, false);

base-commit: 672126dce63c94e7897867e4c0e681806c49cf02
-- 
2.56.0

