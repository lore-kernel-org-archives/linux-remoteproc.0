Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F214AC77B75
	for <linux-remoteproc@archiver.kernel.org>; Tue, 18 Apr 2023 16:30:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232286AbjDRQae (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 18 Apr 2023 12:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232308AbjDRQad (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 18 Apr 2023 12:30:33 -0400
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58C41A275;
        Tue, 18 Apr 2023 09:30:30 -0700 (PDT)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
        by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33IFUFES014815;
        Tue, 18 Apr 2023 16:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=k+YO6RIr8vLsB2LbHEemNhoLEt9cgon4K5DLCr9Mazk=;
 b=AoR/tItyqfLtzYkYHAdTBkUlpi7HuUs1229sXuZtOKlPZV5M7qax6YGDFgU0c+2K2Mia
 EvkH3BZkJj7uoUFwF9aE0cFxRAe244hIcqAa74KPzSSzfPLt9NWyx0vAmn0lhhSlSEro
 5Qn0hm9NJEPMfNhpklWCj+3RhULbfN5Wj9lDMahQSSQ5KIxv2XNHBB6pwBhsktj+xtv5
 x3LZvyASJa5g7DHihE1rVVRD98MoBd0EACQf/Gwtgt5w2TXRWFRj9PgGtZL9236OPktE
 Hj/cAabzGZDBYtVLw3a/jLvRpbSIgpJhPvgjlUhJbZydpAqN4a7dbrwlm5M3qCicrsDP Ag== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q1nk4hfcn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Apr 2023 16:30:24 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
        by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33IGUN0f013553
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 18 Apr 2023 16:30:23 GMT
Received: from hu-bjorande-lv.qualcomm.com (10.49.16.6) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Tue, 18 Apr 2023 09:30:23 -0700
From:   Bjorn Andersson <quic_bjorande@quicinc.com>
To:     Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>
CC:     <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/2] rpmsg: glink: Fix + cleanup in __qcom_glink_send()
Date:   Tue, 18 Apr 2023 09:30:16 -0700
Message-ID: <20230418163018.785524-1-quic_bjorande@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: R92_Prxq7AstB7srFvTQ2qpiZa_Lm-_N
X-Proofpoint-GUID: R92_Prxq7AstB7srFvTQ2qpiZa_Lm-_N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-18_11,2023-04-18_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=660 malwarescore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304180137
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Found these two things to fix/cleanup while poking around in the glink
code.

Bjorn Andersson (2):
  rpmsg: glink: Propagate TX failures in intentless mode as well
  rpmsg: glink: Consolidate TX_DATA and TX_DATA_CONT

 drivers/rpmsg/qcom_glink_native.c | 50 ++++++++++---------------------
 1 file changed, 16 insertions(+), 34 deletions(-)

-- 
2.25.1

