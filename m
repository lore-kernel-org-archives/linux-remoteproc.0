Return-Path: <linux-arm-kernel-bounces+bjorn.andersson=linaro.org@lists.infradead.org>
MIME-Version: 1.0
References: <20200311033908.31960-1-erin.lo@mediatek.com>
In-Reply-To: <20200311033908.31960-1-erin.lo@mediatek.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Mon, 16 Mar 2020 07:39:55 -0400
Message-ID: <CA+5PVA5SQWD0DOeDU4kr9CYQhz6u=o5L3OinG_+2VUxsUEpvbw@mail.gmail.com>
Subject: Re: pull request: linux-firmware: Create Mediatek MT8183 SCP firmware
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+bjorn.andersson=linaro.org@lists.infradead.org
To: Erin Lo <erin.lo@mediatek.com>
Cc: menghui.lin@mediatek.com, Maoguang Meng <maoguang.meng@mediatek.com>, srv_heupstream@mediatek.com, drinkcat@google.com, Yunfei Dong <yunfei.dong@mediatek.com>, linux-remoteproc@vger.kernel.org, Linux Firmware <linux-firmware@kernel.org>, sj.huang@mediatek.com, linux-mediatek@lists.infradead.org, shawnku@google.com, linux-arm-kernel@lists.infradead.org
List-ID: <linux-remoteproc@vger.kernel.org>

On Tue, Mar 10, 2020 at 11:40 PM Erin Lo <erin.lo@mediatek.com> wrote:
>
> The following changes since commit 0148cfefcbf98898ca65bb26d9d7d638b30e211d:
>
>   Merge https://github.com/rjliao-qca/qca-btfw (2020-03-02 08:08:15 -0500)
>
> are available in the Git repository at:
>
>   https://github.com/erinlo/linux_fw_scp v12573.77
>
> for you to fetch changes up to a52150d8e1fe65994464b15ea162bdc89ba61ce8:
>
>   mediatek: Add mt8183 SCP firmware (2020-03-11 10:36:45 +0800)
>
> ----------------------------------------------------------------
> Erin Lo (1):
>       mediatek: Add mt8183 SCP firmware
>
>  mediatek/mt8183/scp.img | Bin 0 -> 1027104 bytes
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  create mode 100644 mediatek/mt8183/scp.img

This file needs to be added to WHENCE.  Can you adjust the commit to add it?

josh

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
