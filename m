Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF183921F0
	for <linux-remoteproc@vger.kernel.org>; Mon,  9 Mar 2026 23:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773097551; cv=none; b=elaZ9uSmjVNZfHmUleiP+8avKUDPq3FYLR22iCotKZbRuZ4H5n4DWaIso2R84Y1fuJV6KesxFK/gdgCIYTYNH74Hk20x96XBrvDsKvpSt4Y1npZmWma51SETiuY1LyQil+LN/n3uh4CzmFrrUexliGDPkCnH+tPgBnyI6l5CFdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773097551; c=relaxed/simple;
	bh=vxfMiR5RjXUasWyw4A83O5C4elvrw071f7dlCLFW+9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LEzrjUao8ZO0j7L3sDTPJmNh8ENB4iTUGXvwoAsV0bObTa4kpW+efvjbQnlri+z2FhW0eU7HpqdP2+ZQuOKnXDCrU1r7Om54avJVYjVR1B71bb7/ciz3WlF2krIvIrCrb7iNUq/14t1psyOLauQY8G2stI6TW7Q/TPjaF7NJnnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gloHc0jc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jTEJu0MJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gloHc0jc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jTEJu0MJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBqBH1297909
	for <linux-remoteproc@vger.kernel.org>; Mon, 9 Mar 2026 23:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4nuiFplGeEP
	W6F+CQFmrK11Lx/4N6iGgXoWw2lOEPQk=; b=gloHc0jcRhYOoGyz7DgdnhjiojN
	H9hpeKUd3Kr08GXwo2N3xaErYbMYE0ASu4NTUYcKjZ9ez2A9Ln/ugpg39/yqLKpt
	mJqC7xYLnB5LKufywMAf1lsUOjU0QpQNbrVZdB+sEyfZQPgeemL8PYJLPvILMPtg
	J9WFvV+Y+4Xa9nvrlKx47wQN0VDhAsMxk6T9hBaepKW6iyHsUBePHNABli94ozlE
	2crJCJTHgxTLIb4YTD/Z6PXFQqMxMW/7NsUo2SFXI008JG2dOtvgKhb9qGrKUvGX
	iIBjRfQLrG1MsJtDR2Pool1dBuNiAgVrmfsr2Hh17M6MiZ/6pAmlisLu84Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv19nw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 23:05:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd83cfb36cso1258684085a.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Mar 2026 16:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773097548; x=1773702348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4nuiFplGeEPW6F+CQFmrK11Lx/4N6iGgXoWw2lOEPQk=;
        b=jTEJu0MJAhxNbmjysgomqhfYcYjYknku0qx7bFVcZoKbwwKDAwmCh61gMEijFL6lIM
         QUpW7k97vzkxS8AaoOVFDhFILXIhQo6tLshwmymfIbSVLO3e6Ipx/pQqVVjDPXGEuntS
         SMKISqVW7DMlqfr/frcyaKaLIiTX4mBkD5elNhbeAYb/CyP1shrlWS1g7li2hcrNGxgt
         mLN4StG4ClTNi7aQ3SwUaCsghA1W82NFQ8csA6mSuVrnM0x0J9tF2dKsIdCVu6lC8QoB
         vCHvAatWnrNVSZcA4MgTBg3mG0JpLxioLewX0hYywRcMHHy/miLPFNQmsXzxoswWIfd8
         Pesw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097548; x=1773702348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4nuiFplGeEPW6F+CQFmrK11Lx/4N6iGgXoWw2lOEPQk=;
        b=oXMCbiIWcn+FcQC+vQqDqmlC60cJENGFNTwawH+s/JchJosW+85piDubN1IjCt4zak
         23l/TB1ky93fEosZTUEPm98OuWDvWjlja0DVF7bpUecDhgsAaEpruudroStwX1M1cRei
         4vzwa4EPshVwsi+V9NelSxfdogySgzJz1QlXFQwbdiKLiUWW45I/AYgTL9CATXFQod/k
         6xz14+TdD76Mz/Xrbs/XPBq4p2fgfZ2iaLXzs2x8XtX6B0IWGOCm3UNuw92RFlmP8imr
         adoMbQhs+w8bp/EKhMjXinE487YvKTD16mI6hbNcUG9CKMohEIxC0beb5mymD3+ZOhoj
         NHmA==
X-Forwarded-Encrypted: i=1; AJvYcCXmUSXrrfOEwhfuPgFEjpSDOPBNSyr4pPa/tCYuCW+5gbCQqFUfIpDYYAdZMk57/PyXMjRv9aHoeXirn+9rvSgS@vger.kernel.org
X-Gm-Message-State: AOJu0YxriHkqaJC3IHqgTKDy7GQ4RkKEPQuz8/Ry50GHayxKs0mx4Hlm
	dL8JLEnwydqni46YQUzHvoXWdIrmST9p8MyBdiKN8f1Saa+oY5tuDNv5Le/c50dnS43qneQwZNp
	fpE7zR2WtVQdTquGJ+nPXj+GdsOY+hWxC1JyW6g34rx6nqRiw0hdMlwF99neg4T8jbFDwzzq+
X-Gm-Gg: ATEYQzzwGwEhfupf6+ri6gM1CPmtAwR8/dQ4InesQ5Q9MK4gYc31MYHrOZnh/OA1Y86
	UmbHZkYVPeI6GbRoJ/j/yz3HruX9V5v3CrI7ugCMCsSQ7Kc44I3PTjhTvTbthS0tQLgib9IB0c0
	g2u1ti103gEo8TgTY+xnI8PrkeuzLFFUswU3pX4FF/7bVzR3ehv08i0pGhWx2TVN7sY2TgfcJ5H
	CNYoiiBJgtkvs8ZLQUv0WxibRgoTm2MIvNicpqQV8Kz2k4cOMNyv6f5OOkoeygK8srGnAJvtJN5
	dFqUJRWWnQJMwLwR2qcFVEQszeUQInoY4lcNFcGCM2XH0e0k7OfniRQTgistuKfbyKOFN4A6T2s
	7tjzmMPLUBkzu0z2+9jUBRwKoRpwtbWZ760opfWX4l44r5wHmqg==
X-Received: by 2002:a05:620a:40d5:b0:8cd:8d4c:aa0c with SMTP id af79cd13be357-8cd8d4cadd9mr467940185a.0.1773097548055;
        Mon, 09 Mar 2026 16:05:48 -0700 (PDT)
X-Received: by 2002:a05:620a:40d5:b0:8cd:8d4c:aa0c with SMTP id af79cd13be357-8cd8d4cadd9mr467934285a.0.1773097547515;
        Mon, 09 Mar 2026 16:05:47 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae3d98asm33898478f8f.30.2026.03.09.16.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:46 -0700 (PDT)
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
Subject: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
Date: Tue, 10 Mar 2026 00:03:30 +0100
Message-ID: <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
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
X-Proofpoint-GUID: fLpW20_T19ePP7NMIgyUdoN_3GYj8AEc
X-Proofpoint-ORIG-GUID: fLpW20_T19ePP7NMIgyUdoN_3GYj8AEc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIwNCBTYWx0ZWRfX41BiFOSYqNtJ
 6PxOfd6EWAoIEV/xtNnXhQIb6PMiVeNBh8D0aRgHlQVBs8e9RCob/jr0QvaLQIPhOP5OepdPI+P
 QqiY73vH4Yk2WDV8LfgQdCazKtvhDrFhVKlLRd89pa4AHCFVrQSJOsgljm6UnFqKYpiUjgglPE9
 yYj6iQL4uCkfh+KPL9rS20Tu/r4gjrOD69jaEzJHvrDlOw6W4rTqfYd4rBImoBRSXvrYeWjadtX
 RSoE+oblbWUWa3VZRf9K9XqFr2ltMgAcgdZ0ObFWXqPCdwatOma2Y0PMSlp2kUEIWpUwT+7jkle
 K9zI5DO0rWBPSPrW0co8IQSvWJLPIGSxPZWVsw+JzBRePjSoTNX1s+npKaHQcdkxsjR8GtBgsFv
 0Sm0eSfYNV2sSc1VdNTDnnRJJVzJVnQblfdhpz01ciYadUDt2pcRQuFY+MWU+5n0qmcXb2r2IPx
 DquyXRI0dDLJThdrnDg==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69af524d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=NWmyY4P_PqWfpxtJLaAA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1011 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090204

The QMI framework proposes a set of services which are defined by an
integer identifier. The different QMI client lookup for the services
via this identifier. Moreover, the function qmi_add_lookup() and
qmi_add_server() must match the service ID but the code in different
places set the same value but with a different macro name. These
macros are spreaded across the different subsystems implementing the
protocols associated with a service. It would make more sense to
define them in the QMI header for the sake of consistency and clarity.

This change use an unified naming for the services and enumerate the
ones implemented in the Linux kernel. More services can come later and
put the service ID in this same header.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 include/linux/soc/qcom/qmi.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index 291cdc7ef49c..b8d07f2c07e7 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -92,6 +92,18 @@ struct qmi_elem_info {
 #define QMI_ERR_INCOMPATIBLE_STATE_V01		90
 #define QMI_ERR_NOT_SUPPORTED_V01		94
 
+/*
+ * Enumerate the IDs of the QMI services
+ */
+#define QMI_SERVICE_ID_TEST		0x0F	/*   15 */
+#define QMI_SERVICE_ID_SSCTL		0x2B	/*   43 */
+#define QMI_SERVICE_ID_IPA		0x31	/*   49 */
+#define QMI_SERVICE_ID_SERVREG_LOC	0x40	/*   64 */
+#define QMI_SERVICE_ID_SERVREG_NOTIF	0x42	/*   66 */
+#define QMI_SERVICE_ID_WLFW		0x45	/*   69 */
+#define QMI_SERVICE_ID_SLIMBUS		0x301	/*  769 */
+#define QMI_SERVICE_ID_USB_AUDIO_STREAM 0x41D	/* 1053 */
+
 /**
  * struct qmi_response_type_v01 - common response header (decoded)
  * @result:	result of the transaction
-- 
2.43.0

