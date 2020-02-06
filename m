Return-Path: <NShubin@topcon.com>
From: Nikita Shubin <NShubin@topcon.com>
Subject: [PATCH] remoteproc: warn on kick missing
Date: Thu,  6 Feb 2020 08:54:19 +0300
Message-Id: <20200206055419.15897-1-NShubin@topcon.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Return-Path: NShubin@topcon.com
MIME-Version: 1.0
Cc: NShubin@topcon.com, Ohad Ben-Cohen <ohad@wizery.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

.kick method not set in rproc_ops will result in:

8<--- cut here ---
Unable to handle kernel NULL pointer dereference

in rproc_virtio_notify, after firmware loading.

At least a warning needed on attempt to call missing method.

Signed-off-by: Nikita Shubin <NShubin@topcon.com>
---
 drivers/remoteproc/remoteproc_virtio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/re=
moteproc_virtio.c
index 8c07cb2ca8ba..77a81f331e3f 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -32,6 +32,12 @@ static bool rproc_virtio_notify(struct virtqueue *vq)

        dev_dbg(&rproc->dev, "kicking vq index: %d\n", notifyid);

+       if (unlikely(rproc->ops->kick =3D=3D NULL)) {
+               WARN_ONCE(rproc->ops->kick =3D=3D NULL, ".kick method not d=
efined for %s",
+                       rproc->name);
+               return false;
+       }
+
        rproc->ops->kick(rproc, notifyid);
        return true;
 }
--
2.24.1

Confidentiality Notice: This message (including attachments) is a private c=
ommunication solely for use of the intended recipient(s). If you are not th=
e intended recipient(s) or believe you received this message in error, noti=
fy the sender immediately and then delete this message. Any other use, rete=
ntion, dissemination or copying is prohibited and may be a violation of law=
, including the Electronic Communication Privacy Act of 1986.   =AD=AD
