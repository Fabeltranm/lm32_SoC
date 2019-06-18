//--------------------------------------------------------------------------------
// Auto-generated by Migen (54d666d) & LiteX (f2570701) on 2019-05-23 11:44:15
//--------------------------------------------------------------------------------
#ifndef __GENERATED_CSR_H
#define __GENERATED_CSR_H
#include <stdint.h>
#ifdef CSR_ACCESSORS_DEFINED
extern void csr_writeb(uint8_t value, unsigned long addr);
extern uint8_t csr_readb(unsigned long addr);
extern void csr_writew(uint16_t value, unsigned long addr);
extern uint16_t csr_readw(unsigned long addr);
extern void csr_writel(uint32_t value, unsigned long addr);
extern uint32_t csr_readl(unsigned long addr);
#else /* ! CSR_ACCESSORS_DEFINED */
#include <hw/common.h>
#endif /* ! CSR_ACCESSORS_DEFINED */

/* ctrl */
#define CSR_CTRL_BASE 0xe0000000L
#define CSR_CTRL_RESET_ADDR 0xe0000000L
#define CSR_CTRL_RESET_SIZE 1
static inline unsigned int ctrl_reset_read(void) {
	unsigned int r = csr_readl(0xe0000000L);
	return r;
}
static inline void ctrl_reset_write(unsigned int value) {
	csr_writel(value, 0xe0000000L);
}
#define CSR_CTRL_SCRATCH_ADDR 0xe0000004L
#define CSR_CTRL_SCRATCH_SIZE 1
static inline unsigned int ctrl_scratch_read(void) {
	unsigned int r = csr_readl(0xe0000004L);
	return r;
}
static inline void ctrl_scratch_write(unsigned int value) {
	csr_writel(value, 0xe0000004L);
}
#define CSR_CTRL_BUS_ERRORS_ADDR 0xe0000008L
#define CSR_CTRL_BUS_ERRORS_SIZE 1
static inline unsigned int ctrl_bus_errors_read(void) {
	unsigned int r = csr_readl(0xe0000008L);
	return r;
}

/* leds */
#define CSR_LEDS_BASE 0xe0001000L
#define CSR_LEDS_OUT_ADDR 0xe0001000L
#define CSR_LEDS_OUT_SIZE 1
static inline unsigned int leds_out_read(void) {
	unsigned int r = csr_readl(0xe0001000L);
	return r;
}
static inline void leds_out_write(unsigned int value) {
	csr_writel(value, 0xe0001000L);
}

/* timer0 */
#define CSR_TIMER0_BASE 0xe0003000L
#define CSR_TIMER0_LOAD_ADDR 0xe0003000L
#define CSR_TIMER0_LOAD_SIZE 1
static inline unsigned int timer0_load_read(void) {
	unsigned int r = csr_readl(0xe0003000L);
	return r;
}
static inline void timer0_load_write(unsigned int value) {
	csr_writel(value, 0xe0003000L);
}
#define CSR_TIMER0_RELOAD_ADDR 0xe0003004L
#define CSR_TIMER0_RELOAD_SIZE 1
static inline unsigned int timer0_reload_read(void) {
	unsigned int r = csr_readl(0xe0003004L);
	return r;
}
static inline void timer0_reload_write(unsigned int value) {
	csr_writel(value, 0xe0003004L);
}
#define CSR_TIMER0_EN_ADDR 0xe0003008L
#define CSR_TIMER0_EN_SIZE 1
static inline unsigned int timer0_en_read(void) {
	unsigned int r = csr_readl(0xe0003008L);
	return r;
}
static inline void timer0_en_write(unsigned int value) {
	csr_writel(value, 0xe0003008L);
}
#define CSR_TIMER0_UPDATE_VALUE_ADDR 0xe000300cL
#define CSR_TIMER0_UPDATE_VALUE_SIZE 1
static inline unsigned int timer0_update_value_read(void) {
	unsigned int r = csr_readl(0xe000300cL);
	return r;
}
static inline void timer0_update_value_write(unsigned int value) {
	csr_writel(value, 0xe000300cL);
}
#define CSR_TIMER0_VALUE_ADDR 0xe0003010L
#define CSR_TIMER0_VALUE_SIZE 1
static inline unsigned int timer0_value_read(void) {
	unsigned int r = csr_readl(0xe0003010L);
	return r;
}
#define CSR_TIMER0_EV_STATUS_ADDR 0xe0003014L
#define CSR_TIMER0_EV_STATUS_SIZE 1
static inline unsigned int timer0_ev_status_read(void) {
	unsigned int r = csr_readl(0xe0003014L);
	return r;
}
static inline void timer0_ev_status_write(unsigned int value) {
	csr_writel(value, 0xe0003014L);
}
#define CSR_TIMER0_EV_PENDING_ADDR 0xe0003018L
#define CSR_TIMER0_EV_PENDING_SIZE 1
static inline unsigned int timer0_ev_pending_read(void) {
	unsigned int r = csr_readl(0xe0003018L);
	return r;
}
static inline void timer0_ev_pending_write(unsigned int value) {
	csr_writel(value, 0xe0003018L);
}
#define CSR_TIMER0_EV_ENABLE_ADDR 0xe000301cL
#define CSR_TIMER0_EV_ENABLE_SIZE 1
static inline unsigned int timer0_ev_enable_read(void) {
	unsigned int r = csr_readl(0xe000301cL);
	return r;
}
static inline void timer0_ev_enable_write(unsigned int value) {
	csr_writel(value, 0xe000301cL);
}

/* uart */
#define CSR_UART_BASE 0xe0002000L
#define CSR_UART_RXTX_ADDR 0xe0002000L
#define CSR_UART_RXTX_SIZE 1
static inline unsigned int uart_rxtx_read(void) {
	unsigned int r = csr_readl(0xe0002000L);
	return r;
}
static inline void uart_rxtx_write(unsigned int value) {
	csr_writel(value, 0xe0002000L);
}
#define CSR_UART_TXFULL_ADDR 0xe0002004L
#define CSR_UART_TXFULL_SIZE 1
static inline unsigned int uart_txfull_read(void) {
	unsigned int r = csr_readl(0xe0002004L);
	return r;
}
#define CSR_UART_RXEMPTY_ADDR 0xe0002008L
#define CSR_UART_RXEMPTY_SIZE 1
static inline unsigned int uart_rxempty_read(void) {
	unsigned int r = csr_readl(0xe0002008L);
	return r;
}
#define CSR_UART_EV_STATUS_ADDR 0xe000200cL
#define CSR_UART_EV_STATUS_SIZE 1
static inline unsigned int uart_ev_status_read(void) {
	unsigned int r = csr_readl(0xe000200cL);
	return r;
}
static inline void uart_ev_status_write(unsigned int value) {
	csr_writel(value, 0xe000200cL);
}
#define CSR_UART_EV_PENDING_ADDR 0xe0002010L
#define CSR_UART_EV_PENDING_SIZE 1
static inline unsigned int uart_ev_pending_read(void) {
	unsigned int r = csr_readl(0xe0002010L);
	return r;
}
static inline void uart_ev_pending_write(unsigned int value) {
	csr_writel(value, 0xe0002010L);
}
#define CSR_UART_EV_ENABLE_ADDR 0xe0002014L
#define CSR_UART_EV_ENABLE_SIZE 1
static inline unsigned int uart_ev_enable_read(void) {
	unsigned int r = csr_readl(0xe0002014L);
	return r;
}
static inline void uart_ev_enable_write(unsigned int value) {
	csr_writel(value, 0xe0002014L);
}

/* uart_phy */
#define CSR_UART_PHY_BASE 0xe0001800L
#define CSR_UART_PHY_TUNING_WORD_ADDR 0xe0001800L
#define CSR_UART_PHY_TUNING_WORD_SIZE 1
static inline unsigned int uart_phy_tuning_word_read(void) {
	unsigned int r = csr_readl(0xe0001800L);
	return r;
}
static inline void uart_phy_tuning_word_write(unsigned int value) {
	csr_writel(value, 0xe0001800L);
}

/* identifier_mem */
#define CSR_IDENTIFIER_MEM_BASE 0xe0002800L

/* constants */
#define TIMER0_INTERRUPT 1
static inline int timer0_interrupt_read(void) {
	return 1;
}
#define UART_INTERRUPT 0
static inline int uart_interrupt_read(void) {
	return 0;
}
#define CSR_DATA_WIDTH 32
static inline int csr_data_width_read(void) {
	return 32;
}
#define SYSTEM_CLOCK_FREQUENCY 32000000
static inline int system_clock_frequency_read(void) {
	return 32000000;
}
#define CONFIG_CLOCK_FREQUENCY 32000000
static inline int config_clock_frequency_read(void) {
	return 32000000;
}
#define CONFIG_CPU_RESET_ADDR 0
static inline int config_cpu_reset_addr_read(void) {
	return 0;
}
#define CONFIG_CPU_TYPE "LM32"
static inline const char * config_cpu_type_read(void) {
	return "LM32";
}
#define CONFIG_CPU_VARIANT "LM32"
static inline const char * config_cpu_variant_read(void) {
	return "LM32";
}
#define CONFIG_CSR_DATA_WIDTH 32
static inline int config_csr_data_width_read(void) {
	return 32;
}

#endif
