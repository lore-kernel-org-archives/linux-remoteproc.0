Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793758432;
	b=HrKDWCCcRcEZ12MaXw30RzPFFRY2DT/6Mkfzzp/lq5fB1aG7dABBfNxw768N5Oook5F2
	 /p1CXy9mK8BKZx5xTVgsqEa2e8CBGK30saFDFBlkAdclR0pX7nqsaFDui42bL7rEdAxS/
	 6Xco8C4J3hkjvpXkhZnUUiQtaVHTX/7FRruqnuaRa+Z0ISLYXBeRnJoewcYzQkMdEP8/R
	 r9zTjFMLhBo/z2XSs64LAOmakBMUj+KIVYVEw5HrZjWAlnAZedseZTZwqej1bmNuf3FJW
	 ws4RvpUyHOHD7wh7oN6ZOaGh+XprZKcz1Pk80U0v2bEjGa8VrlIbw0zHkeoPBHgOCWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793758432;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=ORJQgY3Mt5GiitYLU/biSr+YIS0VGf4guspntGhTOqA=;
	b=nb+H/YcoTbqDAMqUmXMEYSOVo2/27iZiDlDwmYrHipTCTfb691qYgjcjSp9qc3qlp3ke
	 nY0s6yhBq5KEZNxf6WHiBgrbFJ7+oSOJi4WHLJafcHk4sgjIU5Io0RSARdzEIQN9OAI5o
	 FrI8A2ivNRjPcnJOxhNlUsP/N2ojl0eGCgTwCYISnRf+beuMNZ9sr5Xh7SWSHkuh31AC4
	 oKreCOnBvURKvWLtFsorrXQIUJY26pSSgW4JO/0ibp1Ho02S1cQeu6Yw8ZBlEPOLGEn8L
	 rarP4Ow8mN25yVfHBSXuaKUtcvbhUjOMqVwyw5nxzYMV+c6TLTjvTNLo9CYsN81Haeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=iscas.ac.cn;
	spf=pass smtp.mailfrom=iscas.ac.cn;
	arc=none smtp.remote-ip=159.226.251.21
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBFF606A31B;
	Wed,  4 Nov 2026 02:13:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEBFF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from dfae2b116770.home.arpa (unknown [36.110.52.2])
	by APP-01 (Coremail) with SMTP id qwCowACHsfvclOpqt3M+AA--.9586S2;
	Wed, 04 Nov 2026 10:13:48 +0800 (CST)
From: Wentao Liang <vulab@iscas.ac.cn>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [PATCH] rpmsg: qcom_smd: drop the OF node reference on edge release
Date: Wed,  4 Nov 2026 02:13:57 +0000
Message-Id: <20261104021357.1467778-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
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
X-CM-TRANSID:qwCowACHsfvclOpqt3M+AA--.9586S2
X-Coremail-Antispam: 1UD129KBjvdXoWrur1UJw1rKFWxWFWrXr1fJFb_yoWktrX_K3
	sxuwn3XryUCrs5J3W29FZ5Zr9ayF4DWr4xZr4qqFW3XFZ0qrs7WwnYqws5A395Cw4xWry3
	uwn8J3WrAw4IqjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb2kYjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
	0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xf
	McIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7x
	kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
	6cx26r48ZrWUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU5Sg4DUUUUU==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBgkBA2rqY4K6ZAAAsy

qcom_smd_parse_edge() takes a reference on the edge's device node with
of_node_get() and stores it in edge->of_node.  The error path drops that
reference again, but on success it stays in edge->of_node for the
lifetime of the edge and qcom_smd_edge_release() only frees the
channels and the edge itself.  Every registered edge therefore leaks
one OF node reference, and so does the qcom_smd_create_chrdev() failure
path, which also releases the edge through the same callback.

Drop the reference in qcom_smd_edge_release(), where the edge is
destroyed.

Fixes: 53e2822e56c7 ("rpmsg: Introduce Qualcomm SMD backend")
Cc: stable@vger.kernel.org
Assisted-by: DeepSeek-V4.1-Flash and OpenAI Codex
Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
---
 drivers/rpmsg/qcom_smd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rpmsg/qcom_smd.c b/drivers/rpmsg/qcom_smd.c
index 7dbe1c6efe41..7cfde3dea783 100644
--- a/drivers/rpmsg/qcom_smd.c
+++ b/drivers/rpmsg/qcom_smd.c
@@ -1452,6 +1452,7 @@ static void qcom_smd_edge_release(struct device *dev)
 		kfree(channel);
 	}
 
+	of_node_put(edge->of_node);
 	kfree(edge);
 }
 
-- 
2.34.1

