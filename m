Return-Path: <mafeng.ma@huawei.com>
From: Ma Feng <mafeng.ma@huawei.com>
Subject: [PATCH] remoteproc: qcom: Remove unneeded semicolon
Date: Thu, 19 Dec 2019 14:19:36 +0800
Message-ID: <1576736376-114816-1-git-send-email-mafeng.ma@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
To: Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Fixes coccicheck warning:

drivers/remoteproc/qcom_sysmon.c:397:2-3: Unneeded semicolon

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ma Feng <mafeng.ma@huawei.com>
---
 drivers/remoteproc/qcom_sysmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
index c231314..faf3822 100644
--- a/drivers/remoteproc/qcom_sysmon.c
+++ b/drivers/remoteproc/qcom_sysmon.c
@@ -394,7 +394,7 @@ static int ssctl_new_server(struct qmi_handle *qmi, struct qmi_service *svc)
 		break;
 	default:
 		return -EINVAL;
-	};
+	}

 	sysmon->ssctl_version = svc->version;

--
2.6.2
