Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5845538F25C
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Mar 2026 23:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097552; cv=none; b=l6H7RjOAvy+mFSfiZvdf7soecv8QDNZ8GhSLXZ35uDY3D3hj+VqOsE/rPKqps4aViu2j8qEK/7vHju7yQHslvORPQlFf2DESaFkusimNOUSBZp9J9ezgKthhzs2mD3PuOgEdzrnigdLeKxnXOj87FrA6NkQZi2Hx/fmvCRtCBac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097552; c=relaxed/simple;
	bh=zL69uAdweI4X0y0Z+IAisT4rMg++38nfIAzKDgVfeho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nqoJH//ta7nmqj48118Rwd2PHf8Lq0PHGoHlBx0FAdy2axyaP3YAo1eI6HxRGzCv6k1Qo+hW3+BPq/iom7fRooq1Zq4CidVbTYQaAvUfweZsTKCyCI81duza+HbK/FI/mKazGiEEIDY40hDWfuk3dCok5DZNM8md5qLVy6lj2is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lBfD8/ns; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LRXwQU+a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lBfD8/ns";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LRXwQU+a"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HCNH22428827
	for <linux-remoteproc@vger.kernel.org>; Mon, 9 Mar 2026 23:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PTfKdHxXDsD
	Bf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=; b=lBfD8/nsjfep7uWpNTtXTTH97LP
	adqHrnvrTVmVgz0lWbAL5VcrdHrI4FRTSXkiz+u1QcKmurgn/d88hHz/4iBBAoj+
	SgF0dP66UX7GP3KqmHq4FBR51A54fIi9wNxDZIo/awWFssBbLgEaNe0j8xL0eSu4
	6ohLKXiqBj9NRM3ztv9YLcdyDch7tWK3LyfdOBKXfoqDRIixooDyqouwjHgLJuOl
	Z4pMUTPjrfg3DUOyVZm3GPKNXh9IR5fH1JW8M+0dXX3xAhqbHxUTvP+UD3hMdiGU
	wmJYD7HdlW4rfeiSqQS1ja79m2ZdhWjJOgTQi0iWoF0sex2KenSTQG+ihSQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct1eks90k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 23:05:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd900cd3a7so454401685a.0
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 16:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097550; x=1773702350; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PTfKdHxXDsDBf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=;
        b=LRXwQU+ahVItUcd7XgXpLBKk5T4a+a5v6R6I4NCx63YBkMPsfSObF81oTrOp9iicyx
         EX5IYkV1xt3/rq6xrlSZKL1xf8Wt/x+iM+Aj2DALp1I0Dj+s1gTq0P9teJ6Qv6BiPEjt
         dgDHeQOLJnZIhSpmp2laI7BsJNlEW1f59plbJiL5roVffGTQvRPrb8vo1wkmrVzk2z8v
         RVE1UHlvuz73x7lVpOHZKmMQHJMZ8b/HuoKyWLA0poACviJINMqGokaD9KgCDuhdoQx8
         LFQFG4C9GJTMj1yek+rSh1WcZrZSg/GSn5mqePkPpMAH228P8j4IdekoA1JA4qaNeaPi
         iQOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097550; x=1773702350;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PTfKdHxXDsDBf9qbtcJy20RFKCKAaUi+C0QbWC3j2OY=;
        b=IUp3ZycfUQ7yf+dGW6RapIIhVtwdBWXI9vBOO+UIghCs396ih8O9OfBeHvPgNcJ8OD
         9zAzRKI0VAD3xF2WMKJNCOchBbqnC739LOEsx+thMXkM3HKvzMDk40EqlmZ+ZPsQXnOz
         o0WVZHqgFtBr0hm0AA/gqMjCmbXl8LcYxnSmrP2eXY6FTAOu4CmmVCSiUhAiLd83CaPK
         KGVdmCStYW1D1CBHHVUl7r+OmftDPNcZSvP2dDXyV870wOtqbjC+dE4sVQ3E3wXH4h2N
         Wg5kyPCh/nQVIzx3eFujf6YHom6BHuKSLS/Bhq89djzRuEND1W+kX2eAfGnvRPZZXjpw
         RgLA==
X-Forwarded-Encrypted: i=1; AJvYcCU7WxqHTFY0sDWLf/j2yBNIXWBR1+qLijj9L70lPLma69yd5NSSszk/gdl4o6QK1ctoyyv8UAdmJT8TGPNJVpkX@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8U52w4bbXBjZurp9xtVi+04Hb9BEY852co6U//9AhoMfvvYHv
	YcUheEXqy86L37sKayJUdLA5qlERInnkPW4JSOMCGXrwSwBcfCZ/huOI/LkfeM7FYI5nBtWXmFX
	9ofHejZLeEjz5kbL3ietmr0MvZlQHOJgOiwQMwjZKYHm9WaspNwc0b/MaQ0aWgytL02ce44bM
X-Gm-Gg: ATEYQzxzBZaIrsvB+5E75Qgn1n3vehnaPOoEQ3a5qwlkAYJEGMye2+l+aJ+iISJ3KtB
	mhkKmneXHkiOll3pXlI4BGeEqPKlQC2QjZuVzwKDqUWjaosnLwDahBzIDTuYkI3eXWulFqBTGZb
	O+pZisrcjwlpcK1U3htTFrnqHE3U0PUDanvTVkrckbsWbyOFfXqQligy9TL0dipL3uj64PaUMTM
	T16G9Hp2CS2xe8JsnVdFPVWME58MGTlPmLzHIxoJIa/8+9IrTcz4Sa0Fs+gJtdd6x0JgvsyrTWz
	+RoRgsj5C4clJ0wEZGe+7cYdkYe0A7bN/GzYY8JaQi6zk8X/L6BB4RYnnlHYc29F/v7tbiiYbxF
	BNEoWTk7lWajk2+q3a9EhnUYuTsGfh6Lf380PNylFQcwhGNHIzA==
X-Received: by 2002:a05:620a:4002:b0:8ca:2a02:dfd5 with SMTP id af79cd13be357-8cd6d38f9bemr1747204185a.30.1773097549740;
        Mon, 09 Mar 2026 16:05:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4002:b0:8ca:2a02:dfd5 with SMTP id af79cd13be357-8cd6d38f9bemr1747199885a.30.1773097549238;
        Mon, 09 Mar 2026 16:05:49 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:48 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: [PATCH v1 2/8] net: ipa: Use the unified QMI service ID instead of defining it locally
Date: Tue, 10 Mar 2026 00:03:31 +0100
Message-ID: <20260309230346.3584252-3-daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: rOxpjplgRVX8G1fLHgL2iqP57UF0Jd7K
X-Proofpoint-ORIG-GUID: rOxpjplgRVX8G1fLHgL2iqP57UF0Jd7K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX0WuU7KqpQmEZ
 aKBvb7TvmPHVDepJ2J3O5vHD2gAmbTh/OsvaGTPwKCA404GMiS0Tma4VNhG473gd1MiXN8mmnwb
 KdpIQsArza1hjMayp1zfCdMQh8ayaiVRJAOvLy+7RLwOKlwzU0V0bor3N2Fh3k3zlpw9HM5JDiD
 TVpLwT62ZaOAF4xOWe4Fg6N6eykMCE24CKciltvQeVcHMJC4egwN+UJOTKWFYzHdBh9hBoYs4Re
 bdg8FVmRq4MXY9GB8jVDQUSKIBwruyYnc2axHDy9bEzORGHXsrpmYOoQSCONdgcwre7k+CVB/cw
 lYf8HDYBUdIFA4RrobLVwQTOgU6B1wP0Av++fLrcR4a4LRbsUEaw9d2b2HrPDz8avhDC2b4x//p
 K0zJUt8q+KXFglXjb4+SRfk9jeRxtDYObbfbV1jb2G2sxhm6ZRPb0P57h8OHOhnzcnTKn1EyIS5
 83aWNQj4Hx/FmP0hW6A==
X-Authority-Analysis: v=2.4 cv=eIEeTXp1 c=1 sm=1 tr=0 ts=69af524e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8 a=shTvKy1OFHrmHVGPjj8A:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204

Instead of defining a local macro with a custom name for the QMI
service identifier, use the one provided in qmi.h and remove the
locally defined macro.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/net/ipa/ipa_qmi.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ipa/ipa_qmi.c b/drivers/net/ipa/ipa_qmi.c
index d771f3a71f94..37936ad132a2 100644
--- a/drivers/net/ipa/ipa_qmi.c
+++ b/drivers/net/ipa/ipa_qmi.c
@@ -66,11 +66,9 @@
  *   determination of when things are "ready"
  */
 
-#define IPA_HOST_SERVICE_SVC_ID		0x31
 #define IPA_HOST_SVC_VERS		1
 #define IPA_HOST_SERVICE_INS_ID		1
 
-#define IPA_MODEM_SERVICE_SVC_ID	0x31
 #define IPA_MODEM_SERVICE_INS_ID	2
 #define IPA_MODEM_SVC_VERS		1
 
@@ -484,7 +482,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	if (ret)
 		return ret;
 
-	ret = qmi_add_server(&ipa_qmi->server_handle, IPA_HOST_SERVICE_SVC_ID,
+	ret = qmi_add_server(&ipa_qmi->server_handle, QMI_SERVICE_ID_IPA,
 			     IPA_HOST_SVC_VERS, IPA_HOST_SERVICE_INS_ID);
 	if (ret)
 		goto err_server_handle_release;
@@ -501,7 +499,7 @@ int ipa_qmi_setup(struct ipa *ipa)
 	/* We need this ready before the service lookup is added */
 	INIT_WORK(&ipa_qmi->init_driver_work, ipa_client_init_driver_work);
 
-	ret = qmi_add_lookup(&ipa_qmi->client_handle, IPA_MODEM_SERVICE_SVC_ID,
+	ret = qmi_add_lookup(&ipa_qmi->client_handle, QMI_SERVICE_ID_IPA,
 			     IPA_MODEM_SVC_VERS, IPA_MODEM_SERVICE_INS_ID);
 	if (ret)
 		goto err_client_handle_release;
-- 
2.43.0

